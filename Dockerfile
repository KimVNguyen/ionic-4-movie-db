FROM node:10
ARG USR=user

#Does all the things we need to do as root
RUN apt-get update && \
  apt-get install sudo && \
  useradd -ms /bin/bash $USR && \
  usermod -aG sudo $USR && \
  echo "$USR ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
  mkdir /code && \
  chown -R $USR:$USR /code/ && \
  npm install -g ionic

USER $USR:$USR 
WORKDIR /code
ADD . /code/