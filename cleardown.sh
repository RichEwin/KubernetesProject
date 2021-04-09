#!/bin/sh

set -e

# colorcode variables
green='\033[0;32m'
nc='\033[0m'

echo "${green}Listing Deployments ${nc}"
kubectl get pods -o wide

echo "${green}Deleting Deployment ${nc}"
kubectl delete deployment --all

echo "${green}Deleting Service ${nc}"
kubectl delete service --all 

echo "${green}Loading Containers ${nc}"
docker ps -a

echo "${green}Stopping Containers ${nc}"
docker stop $(docker ps -a -q)

echo "${green}Removing Containers ${nc}"
docker rm $(docker ps -a -q)

echo "${green}Container Cleanup Complete ${nc}"

echo "${green}Loading Images ${nc}"
docker images

echo "${green}Image Prune ${nc}"
docker image prune -a

echo "${green}Cleardown Complete ${nc}"
