from setuptools import Extension, setup
from setuptools_ziglang.build_zig_ext import BuildZigExt

from pathlib import Path

INCLUDE_DIRS = [str(Path(__file__).parent.parent / 'src')]
print(f"{INCLUDE_DIRS=}")

setup(
    name="quickstart",
    hpy_ext_modules=[
        Extension(
            name='quickstart_zig',
            sources=['src/quickstart.zig'],
            include_dirs=INCLUDE_DIRS,
        ),
    ],
    cmdclass={'build_ext': BuildZigExt},
    setup_requires=['ziglang', 'setuptools-ziglang' ,'hpy'],
    zip_safe=False,
)

