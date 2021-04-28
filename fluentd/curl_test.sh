

curl -XPUT -k -u admin:admin "https://localhost:9200/some_index/_doc/42?pretty" -H 'Content-Type: application/json' -d'
{
  "field_1": "I am a *text* field type, formerly called *string*!",
  "field_2": 777,
  "field_3": false,
  "created": "1556191252"
}
'
