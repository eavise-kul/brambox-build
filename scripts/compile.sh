#!/bin/bash

# Exit immediately on error and print commands
set -e
set -x

# Install correct dependencies depending on version
version=$(python --version | cut -d' ' -f2)
if [[ $version == 3.6* ]]; then
    python -m pip install numpy==1.13.3 cython==0.29.16
elif [[ $version == 3.7* ]]; then
    python -m pip install numpy==1.14.6 cython==0.29.16
elif [[ $version == 3.8* ]]; then
    python -m pip install numpy==1.17.5 cython==0.29.16
elif [[ $version == 3.9* ]]; then
    python -m pip install numpy==1.19.3 cython==0.29.21
elif [[ $version == 3.10* ]]; then
    python -m pip install numpy==1.21.2 cython==0.29.25
else
    echo "Unsupported python version: $version"
    exit 1
fi

# Build brambox
cd "$1"
CYTHON=1 CDEBUG=0 python setup.py build_ext --force --inplace
