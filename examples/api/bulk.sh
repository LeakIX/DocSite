#!/usr/bin/env bash
API_KEY="YOUR_API_KEY"
QUERY='+plugin:"ElasticSearchOpenPlugin"'

curl -G \
  -H "api-key: ${API_KEY}" \
  --data-urlencode "q=${QUERY}" \
  -o results.json \
  "https://leakix.net/bulk/search"
