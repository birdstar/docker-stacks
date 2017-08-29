#!/usr/bin/env bash

timestamp=$(date +%Y%m%d.%H%M%S)
kg_image_tag="2.0"
kg_image_short_name="kg"


mkdir "${ARTIFACT_DIR}"

cd all-spark-notebook

#wget https://d3kbcqa49mib13.cloudfront.net/spark-2.0.2-bin-hadoop2.7.tgz
cp /opt/dependencies/spark-2.0.2-bin-hadoop2.7.tgz .

tar -zxvf spark-2.0.2-bin-hadoop2.7.tgz

mkdir spark && mv spark-2.0.2-bin-hadoop2.7/* spark/

docker build -t birdstar/all-spark-notebook-kg:v2.0 -f Dockerfile.kernelgateway.root.dist .

mkdir -p docker-stacks/

docker save birdstar/all-spark-notebook-kg:v2.0 | gzip -c > ${ARTIFACT_DIR}/${kg_image_short_name}_${kg_image_tag}.tar.gz

tar -cvzf ${WORKSPACE}/${REPO}.${MY_VER}-${timestamp}.tgz -o "${REPO}-artifact"



