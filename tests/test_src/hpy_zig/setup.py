import os
import logging
from setuptools import Extension, setup
from setuptools.command.build_ext import build_ext
from setuptools._distutils.ccompiler import CCompiler

os.environ["CC"] = 'zig cc'
os.environ["CPP"] = 'zig c++'
os.environ["CXX"] = 'zig c++'
os.environ["LDSHARED"] = 'zig cc -shared'

class build_zig_ext(build_ext):
    ...

logging.basicConfig(level=logging.INFO)


DIR = os.path.dirname(__file__)

setup(
    name="hpy-quickstart",
    hpy_ext_modules=[
        Extension(
            name='quickstart_c', 
            sources=[os.path.join(DIR, 'src/quickstart.c')],
        ),
        Extension(
            name='quickstart_zig',
            sources=[os.path.join(DIR, 'src/quickstart.zig')],
        ),
    ],
    setup_requires=['hpy'],
    zip_safe=False,
)

os.environ.pop("CC")
os.environ.pop("CPP")
os.environ.pop("CXX")
os.environ.pop("LDSHARED")



