topicname="mehendra.demo.migration.rules.v1"

curl --location --request PUT 'https://psrc-7q7vj.ap-southeast-2.aws.confluent.cloud/config/'${topicname}'-value' \
#Auth header
--header 'Content-Type: application/json' \
--data-raw '{
  "compatibilityGroup": "major_version",
  "compatibility": "FORWARD"
}'


#Comments
#Rerunning create-topic-schema.sh will fail as the necessary flags are not set
#At this point the clients need to add the changes to their code.