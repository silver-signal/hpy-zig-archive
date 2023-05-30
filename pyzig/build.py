import sys
import subprocess
import logging
from pathlib import Path
from sysconfig import get_python_version, get_path, get_config_vars
from typing import Optional

from importlib_resources import files, as_file
import hpy.devel.include

def build(
        zig_file_name: str, 
        source: str | Path, 
        define_macros: Optional[list[str]]=None,
        include_dirs: Optional[list[str | Path]]=None,
        cflags: Optional[list[str]]=None, 
        libraries: Optional[list[str]]=None, 
        py_limited_api: bool=False,):

    pyinclude = Path(get_path("include"))
    python_header_dirs = [str(p) for p in pyinclude.iterdir() if p.is_dir()]
    
    ccompiler_include_paths = ["/usr/lib/gcc/x86_64-linux-gnu/12/include"]
    unix_include_paths = ["/usr/include", "/usr/include/x86_64-linux-gnu", "/usr/local/include",]
    include_paths = [get_path("include"), get_path("platinclude"),]
    include_paths.extend(unix_include_paths)
    include_paths.extend(ccompiler_include_paths)
    include_paths.extend(python_header_dirs)
    if include_dirs is not None:
        for dir in include_dirs:
            include_paths.append(str(dir))
    include_paths = [f"-I{path}" for path in include_paths]
    logging.debug(f"{include_paths=}")
    
    defines = ["PY_SSIZE_T_CLEAN"]
    if py_limited_api:
        defines.append("Py_LIMITED_API=0x030900f0")
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

    with open(f"{zig_file_name}.zig", "w") as zig_file:
        subprocess.call(arg_list, stdout=zig_file)


if __name__ == "__main__":
    logging.basicConfig(level=logging.DEBUG)

    python_name = f"python{get_python_version()}" 
    pythonh_source = f"{get_path('include')}/Python.h"
    build(zig_file_name=python_name, source=pythonh_source, py_limited_api=True)
    
    hpy_devel = files(hpy.devel.include)
    with as_file(hpy_devel) as hpy:
        hpy_header = hpy / 'hpy.h'
        build(zig_file_name='hpy_universal', source=hpy_header, define_macros="HPY_ABI_UNIVERSAL", include_dirs=hpy)
        

