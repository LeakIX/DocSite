#!/usr/bin/env bash
API_KEY="YOUR_API_KEY"
QUERY="+plugin:HttpNTLM +country:France"

curl -G \
  -H "api-key: ${API_KEY}" \
  -H 'accept: application/json' \
  --data-urlencode "q=${QUERY}" \
  --data-urlencode "scope=leak" \
  --data-urlencode "page=0" \
  "https://leakix.net/search"
