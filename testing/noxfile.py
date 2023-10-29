import nox
from pathlib import Path

##python_versions = ["3.9", "3.10", "3.11", "3.12",] ## "pypy3.8", "pypy3.9"]
python_versions = ["python3.11"] ## "pypy3.8", "pypy3.9"]

@nox.session(python=python_versions)
def tests(session):
    session.install("setuptools-ziglang")
    session.install("ziglang")
    session.install("hpy")
    session.run(session.python, "setup.py", "--hpy-abi=universal", "bdist_wheel",)
    
    # Get the absolute path for generated wheel
    wheel_list = sorted(Path("dist/").glob("*.whl"))

    for wheel in wheel_list:
        session.install(str(wheel))

    session.install('pytest')
    session.run('pytest')


