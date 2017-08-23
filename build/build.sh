#!/usr/bin/env bash

cd ../all-spark-notebook

#wget https://d3kbcqa49mib13.cloudfront.net/spark-2.0.2-bin-hadoop2.7.tgz
cp /opt/dependencies/spark-2.0.2-bin-hadoop2.7.tgz .

tar -zxvf spark-2.0.2-bin-hadoop2.7.tgz

mkdir -p all-spark-notebook/spark && mv spark-2.0.2-bin-hadoop2.7/* all-spark-notebook/spark/

docker build -t birdstar/all-spark-notebook-kg:v2.0 -f Dockerfile.kernelgateway.root.dist .


