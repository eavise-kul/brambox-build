<img src="https://gitlab.com/EAVISE/brambox/raw/master/docs/.static/logo-wide.png" alt="Logo" width="1000" />

_Brambox build repository_

[![Version][version-badge]][pypi-url]
[![Wheel][wheel-badge]][wheel-url]
[![Travis][travis-badge]][travis-url]
[![Appveyor][appveyor-badge]][appveyor-url]

This repository is responsible for building the brambox pip wheels and uploading them to PyPi.  
It uses the [cibuildwheel](https://github.com/joerick/cibuildwheel) package to generate wheels on travis (linux, macOS) and appveyor (Windows).

## Usage
Whenever there is a new brambox version, pull it in the _brambox_ submodule with:
``` bash
cd brambox
git checkout <tag name>
```

Push these new changes to this repository, which will try to generate wheels for it and upload them to the [PyPi test servers](https://test.pypi.org/project/brambox/).  

If everything seems in order (you might want to test installing the package from these test servers), create a new tag on this repository and push it.
This will rebuild the wheels and actually push them to [PyPi](https://pypi.org/project/brambox/).


[version-badge]: https://img.shields.io/pypi/v/brambox.svg?label=version
[pypi-url]: https://pypi.org/project/brambox/
[wheel-badge]: https://img.shields.io/pypi/wheel/brambox.svg
[wheel-url]: https://pypi.org/project/brambox
[travis-badge]: https://img.shields.io/travis/eavise-kul/brambox-build.svg?label=travis
[travis-url]: https://travis-ci.org/eavise-kul/brambox-build
[appveyor-badge]: https://img.shields.io/appveyor/ci/0phoff/brambox-build.svg?label=appveyor
[appveyor-url]: https://ci.appveyor.com/project/0phoff/brambox-build
