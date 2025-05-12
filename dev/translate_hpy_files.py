"""
This file is for using zig's translate-c functionality to quickly see how a zig implementation of
HPy can look. When running this script, hpy.h will be automatically translated into a file titled
"hpy_universal.zig", and any .c or .h files in this directory will be translated to a zig file of
the same name.

"""

import sys
import subprocess
import logging
from pathlib import Path
from sysconfig import get_path, get_config_vars
from typing import Optional

from importlib_resources import files, as_file
import hpy.devel.include

def translate(
        zig_file_name: str, 
        source: str | Path,
        output_dir: str | Path,
        define_macros: Optional[list[str]]=None,
        include_dirs: Optional[list[str | Path]]=None,
        cflags: Optional[list[str]]=None, 
        libraries: Optional[list[str]]=None, 
        ):

    pyinclude = Path(get_path("include"))
    python_header_dirs = [str(p) for p in pyinclude.iterdir() if p.is_dir()]
   
    include_paths = [get_path("include"), get_path("platinclude"),]
    include_paths.extend(python_header_dirs)
    if include_dirs is not None:
        for dir in include_dirs:
            include_paths.append(str(dir))
    include_paths = [f"-I{path}" for path in include_paths]
    logging.debug(f"{include_paths=}")
    
    defines = ["PY_SSIZE_T_CLEAN"]
    if define_macros is not None:
        defines.extend(define_macros)
    defines = [f"-D{define}" for define in defines]
    logging.debug(f"{defines=}")
    
    cflags = ["-cflags"]
    cflags.extend(get_config_vars('CFLAGS'))
    cflags.append("--")
    cflags = []
    logging.debug(f"{cflags}=")
    
    libs = ["c"]
    if libraries is not None:
        libs.extend(libraries)
    libs = [f"-l{lib}" for lib in libs]
    logging.debug(f"{libs=}")
    
    logging.debug(f"{source=}")

    if source is Path:
        source = source.resolve()
    source_file = [str(source)]

    arg_list = [sys.executable, "-m", "ziglang", "translate-c"]
    arg_list.extend(include_paths)
    arg_list.extend(defines)
    arg_list.extend(cflags)
    arg_list.extend(source_file)
    arg_list.extend(libs)

    if type(output_dir) is str:
        output_dir = Path(output_dir)

    output_file = output_dir / zig_file_name

    with open(f"{output_file}.zig", "w") as zig_file:
        subprocess.call(arg_list, stdout=zig_file)


 
if __name__ == "__main__":
    logging.basicConfig(level=logging.DEBUG)

    hpy_define_macros = [["HPY", "HPY_ABI_UNIVERSAL"], ["HPY", "HPY_ABI_HYBRID"], ["HPY", "HPY_ABI_CPYTHON"]]
    
    hpy_devel = files(hpy.devel.include)
    with as_file(hpy_devel) as hpy:
        hpy_header = hpy / 'hpy.h'
        c_files_dir = Path("./c_files")
        c_file_list = [hpy_header]
        c_file_list.extend(list(c_files_dir.rglob('*.h')))
        c_file_list.extend(list(c_files_dir.rglob('*.c')))
        for file in c_file_list:
            for hpy_define in hpy_define_macros:
                zig_file_name = file.stem
                if hpy_define[1] == "HPY_ABI_UNIVERSAL":
                    zig_file_name = file.stem + "_universal"
                elif hpy_define[1] == "HPY_ABI_HYBRID":
                    zig_file_name = file.stem + "_hybrid"
                elif hpy_define[1] == "HPY_ABI_CPYTHON":
                    zig_file_name = file.stem + "_cpython"

                translate(zig_file_name=zig_file_name, source=file, output_dir="./ctranslate_files/",
                        define_macros=hpy_define, include_dirs=[hpy],
                    )
