#! /bin/bash

CURR_DIR=$(cd "$( dirname "${BASH_SOURCE[0]}")" && pwd)

# Post markdown file to github to get back html
INDEX=${CURR_DIR}/index.md

BODY="$(curl -XPOST -H "Content-Type: text/plain" -H "Accept: application/vnd.github.v3+json" https://api.github.com/markdown/raw -d@${INDEX})"

# Request to github was successful
if [ $? -eq 0 ]; then
    echo "Content-type: text/html"
    echo ""

    # Return the html
    echo "${BODY}"
else
    echo "Content-type: text/plain"
    echo ""

    # Request was not successful, return markdown
    echo "Failed to load html from github api. Here is the markdown instead"
    cat ${INDEX}
fi
