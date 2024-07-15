#!/bin/bash

# Exit immediately on error and print commands
set -e
set -x

# Variables
PACKAGE_DIR=$1
OS=$2
PYTHON=$3
ARCHITECTURE=$4

# Install correct dependencies depending on version
if [[ $PYTHON == '37' ]]; then
    if [[ $ARCHITECTURE == 'aarch64' ]]; then
        python -m pip install "numpy==1.19.5" "cython~=3.0.0" tomli
    else
        python -m pip install "numpy==1.14.6" "cython~=3.0.0" tomli
    fi
elif [[ $PYTHON == '38' ]]; then
    if [[ $ARCHITECTURE == 'aarch64' ]]; then
        python -m pip install "numpy==1.19.5" "cython~=3.0.0" tomli
    else
        python -m pip install "numpy==1.17.5" "cython~=3.0.0" tomli
    fi
elif [[ $PYTHON == '39' ]]; then
    python -m pip install "numpy==2.0.0" "cython~=3.0.0" tomli
elif [[ $PYTHON == '310' ]]; then
    python -m pip install "numpy==2.0.0" "cython~=3.0.0" tomli
elif [[ $PYTHON == '311' ]]; then
    python -m pip install "numpy==2.0.0" "cython~=3.0.0"
elif [[ $PYTHON == '312' ]]; then
    python -m pip install "numpy==2.0.0" "cython~=3.0.0"
else
    echo "Unsupported python version: $PYTHON"
    exit 1
fi

# Go into brambox directory
cd "$1"

# Clean project
python setup.py clean --all
find brambox -type f -name '*.c' -exec rm {} \;
find brambox -type f -name '*.cpp' -exec rm {} \;
find brambox -type f -name '*.so' -exec rm {} \;
find brambox -type f -name '*.dll' -exec rm {} \;
find brambox -type f -name '*.pyd' -exec rm {} \;

# Build project
CYTHON=1 CDEBUG=0 python setup.py build_ext --force --inplace
