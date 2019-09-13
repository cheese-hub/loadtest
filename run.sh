
for i in {1..5}
do
  docker run --name loadtest$i -v `pwd`:/etc/newman -t postman/newman_alpine33 run loadtest_postman_collection.json --environment=tmp/workbench.postman_environment.json.loadtest$i --delay-request=1000 --insecure &
  sleep 2
done

sleep 5

for i in {6..15}
do
  docker run --name loadtest$i -v `pwd`:/etc/newman -t postman/newman_alpine33 run loadtest_postman_collection.json --environment=tmp/workbench.postman_environment.json.loadtest$i --delay-request=1000 --insecure &
  sleep 2
done

sleep 5

for i in {16..25}
do
  docker run --name loadtest$i -v `pwd`:/etc/newman -t postman/newman_alpine33 run loadtest_postman_collection.json --environment=tmp/workbench.postman_environment.json.loadtest$i --delay-request=1000 --insecure &
  sleep 2
done

sleep 5

for i in {26..30}
do
  docker run --name loadtest$i -v `pwd`:/etc/newman -t postman/newman_alpine33 run loadtest_postman_collection.json --environment=tmp/workbench.postman_environment.json.loadtest$i --delay-request=1000 --insecure &
  sleep 2
done

