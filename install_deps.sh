#!/bin/sh
# install colab_ssh deps
export DEBIAN_FRONTEND=noninteractive

ln -fs /usr/share/zoneinfo/America/Pacific /etc/localtime
apt-get install -y tzdata
dpkg-reconfigure --frontend noninteractive tzdata

pwd
cd /usr/lib/python3/dist-packages/
ln -s apt_inst.cpython-38-x86_64-linux-gnu.so apt_inst.so
ln -s apt_pkg.cpython-38-x86_64-linux-gnu.so apt_pkg.so

apt-get source python3-distutils-extra
cd python-distutils-extra-*
python setup.py install

apt-get source python3-apt
cd python-apt-2.0.0ubuntu0.20.04.7
apt build-dep -y ./
python setup.py install