FROM node:10
ARG USR=node

#Does all the things we need to do as root
RUN apt-get update && \
  apt-get install sudo && \
  usermod -aG sudo $USR && \
  echo "$USR ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
  npm install -g ionic && \
  mkdir /code

USER $USR:$USR 
WORKDIR /code
ADD . /code/