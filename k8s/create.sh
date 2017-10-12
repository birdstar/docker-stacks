#!/bin/bash


# get the directory from which this script is running
k8sdir=`dirname ${0}`

# source some helper scripts like k8s_create
. ${k8sdir}/../../devtest-helpers/utils/k8shelper.sh


# use passed in namespace.   if there is none, use default ibm-private-cloud
# to create all spark components
NAMESPACE=${1:-ibm-private-cloud}
#VIRTUAL_IP=$2

#sed -i "s/MLVIP/${VIRTUAL_IP}/g" ${k8sdir}/spark-master-svc.yaml

# exit if any statement returns non-zero return value (e.g. error)
#set -e


#k8s_create "" ${k8sdir}/spark-metrics-pv.yaml
#k8s_create ${NAMESPACE} ${k8sdir}/spark-metrics-pvc.yaml

# Best practice to create services before controller/deployment
k8s_create ${NAMESPACE} ${k8sdir}/kg-svc.yaml
k8s_create ${NAMESPACE} ${k8sdir}/kg-deployment.yaml


