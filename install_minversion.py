#!/usr/bin/python
import os
import argparse
import requests
from fnmatch import fnmatch
from distutils.version import LooseVersion

def get_version(package, minversion=None):
    pypi_data = requests.get(f'https://pypi.org/pypi/{package}/json').json()

    # Get rid of pre-releases and versions smaller than minversion
    versions = []
    for version in pypi_data['releases']:
        try:
            [int(x) for x in version.split('.')]
        except ValueError:
            continue
        else:
            if minversion is None or LooseVersion(version) >= minversion:
                versions.append(version)

    # Find correct version


if __name__ == '__main__':
    #parser = argparse.ArgumentParser('Install correct minimal version of a dependency, according to platform and python')
    #parser.add_argument('--arch', required=True, choices=['mac', 'linux32', 'linux64', 'armv8', 'windows32', 'windows64'])
    #parser.add_argument('package', nargs='+', metavar="packagename[=minversion]")
    #args = parser.parse_args()

    print('ENV\n===')
    print('\n'.join(os.environ.keys()))
    print('===')
