#! /bin/bash

REQUEST_FILE=$1
echo "Request:"
cat $REQUEST_FILE

echo""
echo "Response:"
curl -s -d "@$REQUEST_FILE" -H "Content-Type: application/json" -X POST http://localhost:8080/easypay/api/payments | python -m json.tool
