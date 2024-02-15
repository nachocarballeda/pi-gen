#!/bin/bash -e

apt-get update

virtualenv -p python3 labgrid-venv

source labgrid-venv/bin/activate

pip install --upgrade pip
pip install labgrid
