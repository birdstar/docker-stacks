#!/bin/bash

# Author: Eric
docker rm kg -f 
export SPARK_OPTS="--master mesos://9.30.99.168:5050 --driver-memory 1g --executor-memory 1g --executor-cores 1 --queue thequeue  --conf spark.executor.uri=file:///mnt/share/spark-2.1.0-bin-hadoop2.7.tgz --conf spark.mesos.coarse=false --conf spark.executor.extraClassPath=/mnt/share/iml-library/library/* --conf spark.driver.extraClassPath=/mnt/share/ml-library/library/*"
export SPARK_EXECUTOR_URI="/mnt/share/spark-2.1.0-bin-hadoop2.7.tgz"
#export LIBPROCESS_IP="172.16.179.233"
export LIBPROCESS_IP="9.30.94.12"
export KG_BASE_URL=/jupyter/v2/
#docker run -d --name kg --net=host -v /mnt/kernels/.sparkmagic:/home/jovyan/.sparkmagic -v /mnt/kernels/:/opt/conda/share/jupyter/kernels/ -v /work:/home/jovyan/work -v /mnt/share:/mnt/share -e SPARK_OPTS  -e SPARK_EXECUTOR_URI -e LIBPROCESS_IP  -e KG_BASE_URL birdstar/all-spark-notebook-livy:latest 
docker run -d --name kg --net=host -v /mnt/kernels/.sparkmagic:/home/jovyan/.sparkmagic -v /mnt/kernels/:/opt/conda/share/jupyter/kernels/ -v /work:/home/jovyan/work -v /mnt/share:/mnt/share -e SPARK_OPTS  -e SPARK_EXECUTOR_URI -e LIBPROCESS_IP  -e KG_BASE_URL cuericlee/all-spark-notebook-livy-tensorflow-xgboost:20170727
