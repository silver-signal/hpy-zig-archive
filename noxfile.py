import nox

python_versions = ["3.9", "3.10", "3.11", "3.12", "pypy3.8", "pypy3.9"]

@nox.session(python=python_versions)
def tests(session):
    session.install('pytest')
    session.run('pytest')




