#!/usr/bin/env bash

WEBHOOK="https://discord.com/api/webhooks/1480769239723020401/lmFqlNw6zBr3GFUSZYNlhxeMppqUB3RDBP5s4rh4Q9D8-PdecqKrn_LnedOyVPShjT4B"

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

# Escape output for JSON (newlines -> \n)
json_output=$(echo "$output" | python3 -c 'import json,sys; print(json.dumps(sys.stdin.read()))')

curl -s -X POST \
  -H "Content-Type: application/json" \
  -d "{\"embeds\":[{\"title\":\"$title\",\"description\":\"\`\`\`\n$output\n\`\`\`\",\"color\":$color,\"footer\":{\"text\":\"$host • $ts\"}}]}" \
  "$WEBHOOK"

exit $status
