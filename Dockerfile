# this image is for testing some tasks before committing them to the main repo
FROM ubuntu:noble
ARG DEBIAN_FRONTEND=noninteractive
# https://github.com/ellisonleao/gruvbox.nvim/issues/185#issuecomment-1330044437
ENV TERM=screen-256color

RUN apt-get update
RUN apt-get install -y sudo
RUN apt-get install -y git software-properties-common ansible
RUN apt-get install -y build-essential curl
RUN apt-get install -y neovim

RUN addgroup --gid 1001 gianluca
RUN adduser --gecos gianluca --uid 1001 --gid 1001 gianluca
RUN echo "gianluca:newpass" | chpasswd
RUN adduser gianluca sudo

USER gianluca
WORKDIR /home/gianluca

COPY . .
# RUN make playbook
