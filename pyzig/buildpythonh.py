import sys
import subprocess
import logging
from sysconfig import get_paths
from pathlib import Path

def build_pythonh():
    logging.basicConfig(level=logging.DEBUG)

    major_version = sys.version_info[0]
    minor_version = sys.version_info[1]
    python_name = f"python{major_version}.{minor_version}"

    include_paths = 


if __name__ == "__main__":
    build_pythonh()
