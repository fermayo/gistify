#!/bin/sh
CONTENT=$(cat - | python -c 'import json,sys; print json.dumps(sys.stdin.read())')
cat <<EOF > data.txt
{
  "public": false,
  "files": {
    "out.txt": {
      "content": $CONTENT
    }
  }
}
EOF

curl -sS -X POST https://api.github.com/gists -d @data.txt \
	-H 'Accept: application/vnd.github.v3+json' \
	-H 'Content-Type: application/json; charset=utf-8' \
	| jq -r '.html_url'