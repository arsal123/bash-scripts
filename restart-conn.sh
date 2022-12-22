#!/bin/bash
echo current status of $1
curl -s https://kafka-connect.integration.livongo.com/connectors/$1/status

echo Deleting $1 in Int
curl -X DELETE  https://kafka-connect.integration.livongo.com/connectors/$1
sleep 5

echo Starting $1
curl -X PUT -H "Content-Type: application/json" --data-binary @/opt/persistent/conn-configs/INT-alert-muting-source.json  https://kafka-connect.integration.livongo.com/connectors/$1/config
