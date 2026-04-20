#!/usr/bin/env bash
API_KEY="YOUR_API_KEY"
QUERY='+plugin:"ElasticSearchOpenPlugin"'

curl -H "api-key: ${API_KEY}" \
  "https://leakix.net/bulk/search?q=$(printf '%s' "${QUERY}" | jq -sRr @uri)" \
  -o results.json
