#!/bin/bash

# TODO: Ensure python version is greater than 3
python --version

# install global dependency manager
pip install --user pipenv

# install virtual environment
pip install virtualenv

virtualenv --version