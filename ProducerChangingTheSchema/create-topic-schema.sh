environment=env-p8jmo
kcluster=lkc-9kk0zv
topicname="mehendra.demo.migration.rules.v1"
confluent kafka topic create $topicname --environment $environment --cluster $kcluster --partitions 1  --if-not-exists --config "confluent.value.schema.validation=true"
confluent schema-registry schema create --subject ${topicname}-value --schema schema-version-change.json --type json

#Comments
#Unbale to create the schema due to incompatible changes