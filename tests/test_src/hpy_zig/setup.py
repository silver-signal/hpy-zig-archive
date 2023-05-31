import os
from setuptools import Extension, setup

#os.environ["CC"] = "zig cc"
#os.environ["CXX"] = "zig c++"

# setup.py


DIR = os.path.dirname(__file__)
setup(
    name="hpy-quickstart",
    hpy_ext_modules=[
        Extension('quickstart', sources=[os.path.join(DIR, 'src/quickstart.c')]),
    ],
    setup_requires=['hpy'],
)

