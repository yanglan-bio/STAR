# Work from latest ubuntu 16.04
FROM ubuntu:16.04

# Maintainer
MAINTAINER Yanglan <yanglan_bio@126.com>

# Set variables
ARG STAR_version="2.7.2b"

# Install dependencies
RUN apt-get update \
 && apt-get -y install \
    build-essential \
    vim \
    wget \
    g++ \
    make \
    zlib1g-dev

    
# Install STAR
WORKDIR /usr/local/bin
RUN wget https://github.com/alexdobin/STAR/archive/2.7.2b.tar.gz \
 && tar -xvzf ${STAR_version}.tar.gz
WORKDIR /usr/local/bin/STAR-${STAR_version}/source
RUN make STAR
RUN ln -s /usr/local/bin/STAR-${STAR_version}/bin/Linux_x86_64/STAR /usr/bin/STAR \
 && mkdir /STAR
WORKDIR /STAR
