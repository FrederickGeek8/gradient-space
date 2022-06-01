FROM nvcr.io/nvidia/pytorch:21.04-py3
LABEL Name=paperspace Version=0.0.1
RUN mkdir -p /setup
COPY . /setup
RUN /setup/install_deps.sh
COPY ssh_colab.ipynb /workspace
CMD ["bash", "-c", "/setup/startup.sh"]
