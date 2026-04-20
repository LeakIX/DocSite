#!/usr/bin/env bash
API_KEY="YOUR_API_KEY"
IP="157.90.211.37"

curl -H "api-key: ${API_KEY}" \
  -H 'accept: application/json' \
  "https://leakix.net/host/${IP}"
