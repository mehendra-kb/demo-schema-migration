environment=env-p8jmo
kcluster=lkc-9kk0zv
topicname="mehendra.demo.migration.rules.v1"

# Read the content of the JSON files

json1=$(cat v2-metadatafile.json)
json2=$(cat v2-rulesetfile.json)
json3=$(cat schema-version-change-2.json)

#echo $json3

# Combine the JSON content
combined_json=$(jq -s '.[0] * .[1] * .[2]' <(echo "$json1") <(echo "$json2") <(echo "$json3"))
final_json2=$(jq -n --argjson combined "$combined_json" '{"schemaType": "JSON","version": -1} + $combined')

echo "$final_json2"
exit
curl --location --request POST 'https://psrc-7q7vj.ap-southeast-2.aws.confluent.cloud/subjects/'"$topicname"'-value/versions' \
#Auth header
--header 'Content-Type: application/json' \
--data-raw "$final_json2" 



#Comments
#Unbale to create the schema due to incompatible changes