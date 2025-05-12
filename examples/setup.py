from setuptools import Extension, setup
from setuptools_ziglang.build_zig_ext import BuildZigExt

from pathlib import Path
import shutil

SRC_DIR = Path(__file__).parent.parent / 'src'
src_list = list(SRC_DIR.rglob('*.zig'))
src_list.extend(list(SRC_DIR.rglob('*.c')))
src_list.extend(list(SRC_DIR.rglob('*.h')))

DEST_DIR = Path(__file__).parent / 'src' / 'hpy-zig' / 'src'  

DEST_DIR.mkdir(parents=True, exist_ok=True)

INCLUDE_DIRS = [str(DEST_DIR)]

for file in src_list:
    print(f"Copying {file} to {DEST_DIR}...")
    shutil.copy(file, DEST_DIR)


setup(
    name="hpy_zig_test",
    hpy_ext_modules=[
        Extension(
            name='quickstart',
            sources=['src/quickstart.zig'],
            include_dirs=INCLUDE_DIRS,
        ),
        Extension(
            name='pof',
            sources=['src/pof.zig'],
            include_dirs=INCLUDE_DIRS,
        ),
    ],
    cmdclass={'build_ext': BuildZigExt},
    setup_requires=['ziglang', 'setuptools-ziglang' ,'hpy'],
    zip_safe=False,
)

