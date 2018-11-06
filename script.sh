#!/bin/bash

curl -H "Content-Type: application/json" -X POST \
-d '{"variables": {"user": {"value":"Enrico","type":"String"}}}' \
http://localhost:8080/engine-rest/process-definition/key/Process_prova/start

#curl -H "Content-Type: application/json" -X POST \
#-d '{"variables": {"amount": {"value":555,"type":"long"}, "item": {"value":"item-xyz"}}}' \
#http://localhost:8080/engine-rest/process-definition/key/Process_prova/

