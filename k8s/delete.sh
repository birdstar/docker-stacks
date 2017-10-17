#!/bin/bash



# get the directory from which this script is running
k8sdir=`dirname ${0}`

# source some helper scripts like k8s_create
. ${k8sdir}/../../devtest-helpers/utils/k8shelper.sh

# use passed in namespace.   if there is none, use default ibm-private-cloud
# to create all spark components
NAMESPACE=${1:-ibmdsxuser-re000001}


k8s_delete ${NAMESPACE} ${k8sdir}/kg-svc.yaml
k8s_delete ${NAMESPACE} ${k8sdir}/kg-deployment.yaml



