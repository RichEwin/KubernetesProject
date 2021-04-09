#!/bin/sh

set -e

# colorcode variables
green="\033[0;32m"
ec="\033[0m"

# application variables
application="video-blog"
tag="latest"

# aws variables
account="147415201944"
region="eu-west-2"

# kubernetes variables
application="video-blog"

echo "${green}Logging into AWS ECR${ec}"
aws ecr get-login-password --region ${region}| docker login --username AWS --password-stdin ${account}.dkr.ecr.${region}.amazonaws.com

echo "${green}Building ${application}${ec}"
docker build -t ${application} .

echo "${green}Running ${application}${ec}"
docker run -p 3000:3000 -d ${application}

echo "${green}Tagging ${application}${ec}"
docker tag ${application} ${account}.dkr.ecr.${region}.amazonaws.com/${application}:${tag}

echo "${green}Pushing ${application} to AWS ECR${ec}"
docker push ${account}.dkr.ecr.${region}.amazonaws.com/${application}:${tag}

echo "${green}Deploying ${application} using Kubernetes${ec}"
kubectl apply -f ${application}-deployment.yaml

echo "${green}Deployment Status${ec}"
sleep 15
kubectl get pods

echo "${green}Deployed Successfully${ec}"



