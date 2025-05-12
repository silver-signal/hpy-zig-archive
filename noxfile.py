import os
from pathlib import Path

import nox

nox.options.sessions = ["test_examples"]

# this VENV_DIR constant specifies the name of the dir that the `dev`
# session will create, containing the virtualenv;
# the `resolve()` makes it portable
VENV_DIR = Path("./.venv").resolve()

##python_versions = ["3.9", "3.10", "3.11", "3.12",] ## "pypy3.8", "pypy3.9"]
python_versions = ["python3.12"]  ## "pypy3.8", "pypy3.9"]


@nox.session(python=python_versions)
def test_examples(session):
    session.install("--upgrade", "setuptools", "wheel")
    session.install("setuptools-ziglang")
    session.install("hpy")
    session.install("pytest")

    with session.chdir("examples"):
        session.run(
            session.python,
            "setup.py",
            "--hpy-abi=universal",
            "bdist_wheel",
        )

        # Get the absolute path for generated wheel
        wheel_list = sorted(Path("dist/").glob("*.whl"))

        for wheel in wheel_list:
            session.install(str(wheel))

    session.run("pytest", "examples/")


@nox.session()
def dev(session: nox.Session) -> None:
    session.install("virtualenv")
    session.run("virtualenv", os.fsdecode(VENV_DIR), silent=True)
    python = os.fsdecode(VENV_DIR.joinpath("bin/python"))
    session.run(
        python, "-m", "pip", "install", "-r", "dev-requirements.txt", external=True
    )
