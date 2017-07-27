#!/bin/bash

# Author: Eric
docker rm nb -f
#export KG_URL="http://9.30.167.73:9999"
export KG_URL="http://$(hostname -I|awk '{print $1}'):9999/jupyter/v2"
docker run -d --name nb  --net=host  -v /work:/home/jovyan/work -v /mnt/share:/mnt/share -e KG_URL birdstar/all-spark-notebook-nb:latest
