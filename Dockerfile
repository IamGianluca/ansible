# this image is for testing some tasks before committing them to the main repo
FROM ubuntu:jammy
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y sudo
RUN apt-get install -y git software-properties-common ansible 
RUN apt-get install -y build-essential curl
RUN apt-get install -y vim

RUN addgroup --gid 1000 gianluca
RUN adduser --gecos gianluca --uid 1000 --gid 1000 gianluca
RUN echo "gianluca:newpass" | chpasswd
RUN adduser gianluca sudo

USER gianluca
WORKDIR /home/gianluca

COPY . .
# RUN make playbook
