#!/bin/bash

CURR_DIR=$(cd "$( dirname "${BASH_SOURCE[0]}")" && pwd)
cd CURR_DIR

# Extract the package
tar -xzf package.tgz
rm package.tgz

# Copy public_html folder from project to webdrive
cp -rf public_html ${HOME}/webdrive
