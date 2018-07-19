FROM ubuntu:14.04
LABEL name="node10"

# Install dependencies
RUN apt-get update -y
RUN apt-get install -y git curl build-essential
RUN apt-get install -y python2.7 python-pip

# Install node
RUN curl --silent --location https://deb.nodesource.com/setup_10.x | sudo bash -
RUN apt-get install -y nodejs

RUN npm install -g node-gyp

# Work directory
WORKDIR /usr/src/app
