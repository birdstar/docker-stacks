#!/usr/bin/env bash

cd ../all-spark-notebook

#wget https://d3kbcqa49mib13.cloudfront.net/spark-2.0.2-bin-hadoop2.7.tgz
cp /opt/dependencies/spark-2.0.2-bin-hadoop2.7.tgz .

tar -zxvf spark-2.0.2-bin-hadoop2.7.tgz

mkdir spark && mv spark-2.0.2-bin-hadoop2.7/* spark/

docker build -t birdstar/all-spark-notebook-kg:v2.0 -f Dockerfile.kernelgateway.root.dist .


