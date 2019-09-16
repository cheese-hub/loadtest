# Basic CHEESEhub load simulation

This is a very rough load simulator for CHEESEHub


## Create the test accounts

Note, this assumes `ndslabsctl` is in your PATH and that you know apiserver password.
```
git clone https://github.com/nds-org/ndslabs-startup
cd scripts/AccountCreation
python account.py https://www.hub.cheesehub.org --prefix loadtest --passwordPrefix loadtest --count 30
```

## Generate the test configurations

Update `HOST` placeholder in `workbench.postman_environment.json` with actual host (e.g., www.hub.cheesehub.org).

The following command will produce a set of 30 postman environments with username/password test.
```
./gen.sh
```

## Run the test

The following command will use the `newman` container run 30 different test suites. In this case,
it will start and stop the ArpSpoof stack for each user. 
```
./run.sh
```


### Monitor
Via `kubectl`:
```
watch "kubectl get pods --all-namespaces -o wide | grep load"
```

You can also look at the logs for each of the newman containers:
```
docker logs loadtestN
```


## Cleanup test accounts

```
ndslabsctl login admin
for i in {1..30}; do ndslabsctl delete account loadtest$i; done
```


### Cleanup test containers
```
for i in {1..30}; do docker stop loadtest$i; done
for i in {1..30}; do docker rm loadtest$i; done
```
