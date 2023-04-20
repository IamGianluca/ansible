# this image is for testing some tasks before committing them to the main repo
FROM ubuntu
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y git software-properties-common ansible

WORKDIR /home
