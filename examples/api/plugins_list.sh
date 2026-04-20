#!/usr/bin/env bash
API_KEY="YOUR_API_KEY"

curl -H "api-key: ${API_KEY}" \
  -H 'accept: application/json' \
  "https://leakix.net/api/plugins"
