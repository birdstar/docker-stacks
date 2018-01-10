#!/bin/bash
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

set -e

exec jupyter kernelgateway --debug --KernelGatewayApp.ip=0.0.0.0 --KernelGatewayApp.port=9999 --JupyterWebsocketPersonality.list_kernels=True &&
export KG_URL="http://127.0.0.1:9999" && jupyter notebook \
     --NotebookApp.ip=0.0.0.0 \
     --NotebookApp.port=9898 \
     --NotebookApp.session_manager_class=nb2kg.managers.SessionManager \
     --NotebookApp.kernel_manager_class=nb2kg.managers.RemoteKernelManager \
     --NotebookApp.kernel_spec_manager_class=nb2kg.managers.RemoteKernelSpecManager


