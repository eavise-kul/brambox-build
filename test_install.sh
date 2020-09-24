#!/usr/bin/env bash
# Test new brambox version from pypi test servers

# INSTALL
cd ~
source `which virtualenvwrapper.sh`
mkvirtualenv -p python3.6 bramboxtest || exit
pip install --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple brambox

# CHECK
echo -e "\n==========\n"
python -c "import brambox as bb; print(f'Brambox Version {bb.__version__}')"
echo -e "\n==========\n"
read -p "Press enter to continue"

# CLEANUP
deactivate
rmvirtualenv bramboxtest
cd -
