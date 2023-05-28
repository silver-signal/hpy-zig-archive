import sys
import subprocess
import logging
from pathlib import Path
from sysconfig import get_python_version, get_path, get_config_vars
from typing import Optional

def build_pythonh(defines: Optional[list[str]]=None, cflags: Optional[list[str]]=None, 
                  libs: Optional[list[str]]=None, source: Optional[str]=None, py_limited_api: bool=False,):
    logging.basicConfig(level=logging.DEBUG)

    python_name = f"python{get_python_version()}"
    
    pyinclude = Path(get_path("include"))
    python_header_dirs = [str(p) for p in pyinclude.iterdir() if p.is_dir()]
    ccompiler_include_paths = ["/usr/lib/gcc/x86_64-linux-gnu/12/include"]
    c_include_paths = ["/usr/include", "/usr/include/x86_64-linux-gnu", "/usr/local/include",]
    include_paths = [get_path("include"), get_path("platinclude"),]
    include_paths.extend(c_include_paths)
    include_paths.extend(ccompiler_include_paths)
    include_paths.extend(python_header_dirs)
    source = [f"{get_path('include')}/Python.h"]
    include_paths = [f"-I{path}" for path in include_paths]
    logging.debug(f"{include_paths=}")
    defines = ["PY_SSIZE_T_CLEAN"]
    if py_limited_api:
        defines.append("Py_LIMITED_API=3")
    defines = [f"-D{define}" for define in defines]
    logging.debug(f"{defines=}")
    cflags = ["-cflags"]
    cflags.extend(get_config_vars('CFLAGS'))
    cflags.append("--")
    cflags = []
    logging.debug(f"{cflags}=")
    logging.debug(f"{source=}")
    libs = ["c"]
    libs = [f"-l{lib}" for lib in libs]
    logging.debug(f"{libs=}")

    arg_list = [sys.executable, "-m", "ziglang", "translate-c"]
    arg_list.extend(include_paths)
    arg_list.extend(defines)
    arg_list.extend(cflags)
    arg_list.extend(source)
    arg_list.extend(libs)

    with open(f"{python_name}.zig", "w") as zig_file:
        subprocess.call(arg_list, stdout=zig_file)


if __name__ == "__main__":
    build_pythonh()
