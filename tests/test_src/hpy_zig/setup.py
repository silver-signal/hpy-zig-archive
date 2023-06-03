import os
from setuptools import Extension, setup
from setuptools.command.build_ext import build_ext
import sysconfig

EXTRA_COMPILE_ARGS = ["-Wsign-compare", "-DNDEBUG", "-g", "-fwrapv", "-O2", "-Wall", "-g", "-fstack-protector-strong", "-Wformat", "-Werror=format-security",  "-g", "-fwrapv", "-O2",]
EXTRA_LINK_ARGS = ["-g", "-fwrapv", "-O2",]

print(f"{EXTRA_COMPILE_ARGS=}")
print(f"{EXTRA_LINK_ARGS=}")

class custom_build_ext(build_ext):
    def build_extensions(self):
        self.compiler.set_executable("compiler", ["zig", "cc"])
        self.compiler.set_executable("compiler_so", ["zig", "cc"])
        self.compiler.set_executable("compiler_cxx", ["zig", "cc"])
        self.compiler.set_executable("linker_so", ["zig", "cc", "-shared"])
        self.compiler.set_executable("linker_exe", ["zig", "cc"])
        self.compiler.set_executable("archiver", ["zig", "ar", "-cr"])
        self.compiler.set_executable("ranlib", None)
        build_ext.build_extensions(self)

DIR = os.path.dirname(__file__)
setup(
    name="hpy-quickstart",
    hpy_ext_modules=[
        Extension(
            name='quickstart', 
            sources=[os.path.join(DIR, 'src/quickstart.c')],
            extra_compile_args=EXTRA_COMPILE_ARGS,
            extra_link_args=EXTRA_LINK_ARGS,
        ),
    ],
    setup_requires=['hpy'],
    zip_safe=False,
    cmdclass={"build_ext": custom_build_ext},
)

