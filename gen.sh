
mkdir -p tmp
for i in {1..30}
do
  cat workbench.postman_environment.json | sed "s/USERNAME/loadtest$i/g" | sed "s/PASSWORD/loadtest$i/g" > tmp/workbench.postman_environment.json.loadtest$i
done
