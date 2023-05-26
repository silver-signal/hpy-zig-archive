from setuptools import Extension, setup

setup(
    name='zig_ext_test',
    version='0.0.0',
    build_zig=True,
    ext_modules=[Extension('zig_ext_test.sum', ['sum.zig' ])],
    setup_requires=['pyzig'],
)

