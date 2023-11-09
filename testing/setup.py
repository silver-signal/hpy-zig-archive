from setuptools import Extension, setup
from setuptools_ziglang.build_zig_ext import BuildZigExt

from pathlib import Path
import shutil

SRC_DIR = Path(__file__).parent.parent / 'src'
src_list = list(SRC_DIR.rglob('*.zig'))
DEST_DIR = Path(__file__).parent / 'src' / 'hpy-zig' / 'src'  

DEST_DIR.mkdir(parents=True, exist_ok=True)

for file in src_list:
    print(f"Copying {file} to {DEST_DIR}...")
    shutil.copy(file, DEST_DIR)


setup(
    name="quickstart",
    hpy_ext_modules=[
        Extension(
            name='quickstart_zig',
            sources=['src/quickstart.zig'],
        ),
        Extension(
            name='pof',
            sources=['src/pof_c.zig'],
        ),
    ],
    cmdclass={'build_ext': BuildZigExt},
    setup_requires=['ziglang', 'setuptools-ziglang' ,'hpy'],
    zip_safe=False,
)

