# this image is for testing some tasks before committing them to the main repo
FROM ubuntu
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update

# required to use ansible
RUN apt-get install -y git software-properties-common ansible 

# required to use make
RUN apt-get install -y build-essential

COPY makefile /home/makefile

WORKDIR /home
