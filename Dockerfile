#Specify operating system image.
FROM ubuntu:bionic

#Root user.
USER root

#Install ensembl-vep dependencies.
WORKDIR /usr/local/bin
RUN apt-get update -y && apt-get install -y \
    libdbi-perl \
    libdbd-mysql-perl \
    build-essential \
    zlib1g-dev \
    libmodule-build-perl \
    cpanminus \ 
    sudo \
    wget \
    unzip \
    perl \
    curl \ 
    git 

#Get ready to install ensembl-vep.
WORKDIR /usr/local/bin
RUN mkdir -p /opt/vep_cache
RUN wget https://github.com/Ensembl/ensembl-vep/archive/release/93.zip
RUN unzip 93.zip
WORKDIR ensembl-vep-release-93/

#Install ensembl-vep.
RUN yes n | perl INSTALL.pl
