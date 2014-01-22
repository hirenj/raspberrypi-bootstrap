# Nginx
#
# VERSION               0.0.1

FROM       resin/rpi-raspbian 
MAINTAINER Hiren Joshi 

# make sure the package repository is up to date
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y vim curl libfreetype6 libfreetype6-dev libfreeimage3 libfreeimage-dev python curl g++ make
RUN curl -O -L https://gist.github.com/raw/3245130/v0.10.24/node-v0.10.24-linux-arm-armv6j-vfp-hard.tar.gz
RUN mkdir /usr/local/node && cd /usr/local/node && tar zxvf ~/node-v0.10.24-linux-arm-armv6j-vfp-hard.tar.gz --strip=1 && export PATH=$PATH:/usr/local/node/bin
