#!/usr/bin/env bash

echo "Recommendations for user: u1"
echo ""
curl -k -H "Content-Type: application/json" -d '
{
    "user": "u1"
}' https://localhost:8000/queries.json
echo ""
