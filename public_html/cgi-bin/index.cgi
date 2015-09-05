#! /bin/bash

CURR_DIR=$(cd "$( dirname "${BASH_SOURCE[0]}")" && pwd)

echo "X-COMP-490: ${USER}"
echo "Content-type: text/plain"
echo ""

cat ${CURR_DIR}/../index.md
