#!/usr/bin/env bash

source "$HOME/scripts/.env"

output=$(git -C "$HOME/repos/VueTorrent" pull 2>&1)
status=$?
host=$(hostname)
ts=$(date)

if [ $status -eq 0 ]; then
  color=3066993
  title="VueTorrent Update Successful"
else
  color=15158332
  title="VueTorrent Update Failed"
fi

payload=$(python3 -c "
import json, sys
output = sys.argv[1]
title  = sys.argv[2]
color  = int(sys.argv[3])
footer = sys.argv[4]
print(json.dumps({
    'embeds': [{
        'title': title,
        'description': '\`\`\`\n' + output + '\n\`\`\`',
        'color': color,
        'footer': {'text': footer}
    }]
}))
" "$output" "$title" "$color" "$host • $ts")

curl -s -X POST \
  -H "Content-Type: application/json" \
  -d "$payload" \
  "$WEBHOOK"

exit $status
