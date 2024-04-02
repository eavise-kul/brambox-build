<img src="https://gitlab.com/EAVISE/brambox/raw/master/docs/.static/logo-wide.png" alt="Logo" width="1000" />

_Brambox build repository_

[![Version][version-badge]][pypi-url]
[![Wheel][wheel-badge]][wheel-url]
[![Build][build-badge]][build-url]


This repository is responsible for building the brambox pip wheels and uploading them to PyPi.  
It uses the [cibuildwheel](https://github.com/joerick/cibuildwheel) package to generate wheels through Github Actions.

## Usage
Whenever there is a new brambox version, pull it in the _brambox_ submodule with:
``` bash
git submodule update
cd brambox
git fetch
git checkout <tag name>
```

Push these new changes to this repository, which will try to generate wheels for it and upload them to the [PyPi test servers](https://test.pypi.org/project/brambox/)
and try to install the new package on various different platforms.

If everything seems in order, create a new tag on this repository and push it.
This will rebuild the wheels and actually push them to [PyPi](https://pypi.org/project/brambox/).

``` bash
git tag 'vX.Y.Z'
git push --tags
```


[version-badge]: https://img.shields.io/pypi/v/brambox.svg?label=version
[pypi-url]: https://pypi.org/project/brambox/
[wheel-badge]: https://img.shields.io/pypi/wheel/brambox.svg
[wheel-url]: https://pypi.org/project/brambox
[build-badge]: https://github.com/eavise-kul/brambox-build/actions/workflows/wheels.yml/badge.svg
[build-url]: https://github.com/eavise-kul/brambox-build/actions/workflows/wheels.yml
