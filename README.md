to test browse to: https://localhost:9200/

the username/password for basic auth is admin/admin

if you get an error that says, "max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
#10" run:

sudo sysctl -w vm.max_map_count=262144
