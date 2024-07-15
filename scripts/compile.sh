#!/bin/bash

# Exit immediately on error and print commands
set -e
set -x

# Install correct dependencies depending on version
pip cache purge
version=$(python --version | cut -d' ' -f2)
if [[ $version == 3.6* ]]; then
    python -m pip install "numpy==1.13.3" "cython~=3.0.0" tomli
elif [[ $version == 3.7* ]]; then
    python -m pip install "numpy==1.14.6" "cython~=3.0.0" tomli
elif [[ $version == 3.8* ]]; then
    python -m pip install "numpy==1.17.5" "cython~=3.0.0" tomli
elif [[ $version == 3.9* ]]; then
    python -m pip install "numpy==2.0.0" "cython~=3.0.0" tomli
elif [[ $version == 3.10* ]]; then
    python -m pip install "numpy==2.0.0" "cython~=3.0.0" tomli
elif [[ $version == 3.11* ]]; then
    python -m pip install "numpy==2.0.0" "cython~=3.0.0"
elif [[ $version == 3.12* ]]; then
    python -m pip install "numpy==2.0.0" "cython~=3.0.0"
else
    echo "Unsupported python version: $version"
    exit 1
fi

# Go into brambox directory
cd "$1"

# Clean project
find brambox -type f -name '*.c' -exec rm {} \;
find brambox -type f -name '*.cpp' -exec rm {} \;
find brambox -type f -name '*.so' -exec rm {} \;
find brambox -type f -name '*.dll' -exec rm {} \;
find brambox -type f -name '*.pyd' -exec rm {} \;

# Build project
CYTHON=1 CDEBUG=0 python setup.py build_ext --force --inplace
