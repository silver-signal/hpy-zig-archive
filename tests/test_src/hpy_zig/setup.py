from setuptools import Extension, setup

from setuptools_ziglang.build_zig_ext import BuildZigExt

setup(
    name="hpy-quickstart",
    hpy_ext_modules=[
        Extension(
            name='quickstart_c', 
            sources=['src/quickstart.c'],
            py_limited_api=True,
        ),
        Extension(
            name='quickstart_zig',
            sources=['src/quickstart.zig'],
            py_limited_api=True,
        ),
    ],
    cmdclass={'build_ext': BuildZigExt},
    setup_requires=['ziglang', 'setuptools-ziglang' ,'hpy'],
    zip_safe=False,
)

