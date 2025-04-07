#!/bin/bash
environment=env-p8jmo
kcluster=lkc-9kk0zv
topicname="mehendra.demo.migration.rules.v1"

# Read the content of the JSON files

json1=$(cat v1-metadatafile.json)
json2=$(cat initial-schema-version-1.json)

# Combine the JSON content
combined_json=$(jq -s '.[0] * .[1]' <(echo "$json1") <(echo "$json2"))
final_json=$(jq -n --argjson combined "$combined_json" '{"schemaType": "JSON"} + $combined')

curl --location --request POST 'https://psrc-7q7vj.ap-southeast-2.aws.confluent.cloud/subjects/'"$topicname"'-value/versions' \
#Auth header
--header 'Content-Type: application/json' \
--data-raw "$final_json" 

#Comments
#Unbale to create the schema due to incompatible changes