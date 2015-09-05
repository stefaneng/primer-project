#!/bin/bash

CURR_DIR=$(cd "$( dirname "${BASH_SOURCE[0]}")" && pwd)
cd $CURR_DIR

# Extract the package
tar -xzf package.tgz
rm package.tgz

# Make directory if it does not exist
mkdir -p ${HOME}/webdrive/public_html/primer_project

# Copy public_html folder from project to webdrive
cp -rf public_html/* ${HOME}/webdrive/public_html/primer_project

# Cleanup folder
rm -rf public_html
