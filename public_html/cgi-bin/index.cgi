#! /bin/bash

CURR_DIR=$(cd "$( dirname "${BASH_SOURCE[0]}")" && pwd)

# Post markdown file to github to get back html
INDEX=${CURR_DIR}/index.md

# Check query string for raw=true
if [ "${QUERY_STRING}" = "raw=true" ]; then
    echo "Content-type: text/plain"
    echo ""
    # Return markdown instead of html
    cat ${INDEX}
    exit
fi

# Post markdown to github to render as html
BODY="$(/usr/bin/curl -s -XPOST -H "Content-Type: text/plain" -H "Accept: application/vnd.github.v3+json" https://api.github.com/markdown/raw --data-binary @${INDEX})"

err=$?

# Request to github was successful
if [ $err -eq 0 ]; then
    echo "Content-type: text/html"
    echo ""

    # Return the html with templates replaced
    while IFS='' read -r line || [[ -n "$line" ]]; do
        case "$line" in
            *"<!--BODY-->"*)
                echo "$BODY"
                ;;
            *"<!--TIME-->"*)
                date
                ;;
            *)
                echo "$line"
                ;;
        esac
    done < ${CURR_DIR}/../template.html

else
    echo "Content-type: text/plain"
    echo ""

    # Request was not successful, return markdown
    echo "Error ${err}: Failed to load html from github api. Here is the markdown instead"
    cat ${INDEX}
fi
