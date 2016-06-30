#!/bin/sh
CONTENT=$(cat -)
BODY=$(cat <<EOF
{
  "public": false,
  "files": {
    "out.txt": {
      "content": "$CONTENT"
    }
  }
}
EOF
)
curl -sS -X POST https://api.github.com/gists -d "$BODY" \
	-H 'Accept: application/vnd.github.v3+json' \
	-H 'Content-Type: application/json; charset=utf-8' \
	| jq -r '.html_url'
