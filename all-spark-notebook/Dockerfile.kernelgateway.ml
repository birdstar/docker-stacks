FROM cuericlee/all-spark-notebook-livy-tensorflow-xgboost:latest

MAINTAINER ML Project

USER root

RUN pip install urllib3==1.21.1
RUN pip install certifi==2017.4.17
RUN pip2 install brunel==2.3

EXPOSE 9999
#CMD ["jupyter", "kernelgateway", "--KernelGatewayApp.ip=0.0.0.0", "--KernelGatewayApp.port=9999", "--JupyterWebsocketPersonality.list_kernels=True", "--KernelGatewayApp.allow_origin=‘*’"]
CMD ["jupyter", "kernelgateway", "--KernelGatewayApp.ip=0.0.0.0", "--KernelGatewayApp.port=9999", "--JupyterWebsocketPersonality.list_kernels=True"]
