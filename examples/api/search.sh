#!/usr/bin/env bash
API_KEY="YOUR_API_KEY"
QUERY="+plugin:HttpNTLM +country:France"

curl -H "api-key: ${API_KEY}" \
  -H 'accept: application/json' \
  "https://leakix.net/search?scope=leak&page=0&q=$(printf '%s' "${QUERY}" | jq -sRr @uri)"
