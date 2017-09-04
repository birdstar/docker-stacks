#!/usr/bin/env bash

timestamp=$(date +%Y%m%d.%H%M%S)
kg_image_tag="v2.0"
kg_image_short_name="kg"

mkdir -p /tmp/docker-stacks


# Use local registry
local_docker_server="localhost:5000"


# Image-names
kg_image_name="${local_docker_server}/all-spark-notebook-kg:${kg_image_tag}"


cd all-spark-notebook

#wget https://d3kbcqa49mib13.cloudfront.net/spark-2.0.2-bin-hadoop2.7.tgz
cp /opt/dependencies/spark-2.1.1-bin-hadoop2.7.tgz .

tar -zxvf spark-2.1.1-bin-hadoop2.7.tgz

#mkdir spark && mv spark-2.1.1-bin-hadoop2.7/* spark/
mkdir spark && mv spark-dk-2.1.1.0/spark/* spark/

docker build -t ${kg_image_name} -f Dockerfile.kernelgateway.root.dist .

cd ../

#docker save birdstar/all-spark-notebook-kg:v2.0 | gzip -c > ${REPO}-artifact/${kg_image_short_name}_${kg_image_tag}.tar.gz
docker save ${kg_image_name} | gzip -c > /tmp/${PROJECT_NAME}/${kg_image_short_name}_${kg_image_tag}.tar.gz

#tar -cvzf ${WORKSPACE}/${REPO}.${kg_image_tag}-${timestamp}.tgz -o "${REPO}-artifact"



