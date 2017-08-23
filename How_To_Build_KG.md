# How to Build Kernel Gateway

## Dockerfile location

The Dockerfile locates at `all-spark-notebook/Dockerfile.kernelgateway.root.dist`

## Pre-condition

When I am writing this doc, we need to support Spark-2.0.2, but in the original base image, only spark 2.1.0 is provided. 

So we need to manually download the spark 2.0.2:

1. `wget https://d3kbcqa49mib13.cloudfront.net/spark-2.0.2-bin-hadoop2.7.tgz`

2. Unzip this zip file: `tar -zxvf spark-2.0.2-bin-hadoop2.7.tgz`

3. move it to `all-spark-notebook` folder and rename it as `spark`:
`mkdir -p all-spark-notebook/spark && mv spark-2.0.2-bin-hadoop2.7/* all-spark-notebook/spark/`

## Build

`docker build -t birdstar/all-spark-notebook-kg:v2.0 -f Dockerfile.kernelgateway.root.dist .`

You can get the docker image `birdstar/all-spark-notebook-kg:v2.0`
