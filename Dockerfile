FROM nvcr.io/nvidia/pytorch:21.04-py3
LABEL Name=paperspace Version=0.0.1
RUN mkdir -p /setup
COPY . /setup

# Install deps
RUN pip install -U pip
RUN pip install -r /setup/requirements.txt

# set up python-apt
RUN sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list
RUN apt-get update && apt-get install -y python3 python3-apt

RUN /setup/install_deps.sh
COPY ssh_colab.ipynb /workspace
CMD ["bash", "-c", "/setup/startup.sh"]
