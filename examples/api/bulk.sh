#!/usr/bin/env bash
curl -H 'api-key: YOUR_API_KEY' \
  "https://leakix.net/bulk/search?q=searchquery" \
  -o results.json
