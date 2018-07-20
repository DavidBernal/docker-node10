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

RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update -y && apt-get install google-cloud-sdk -y

RUN sudo apt-get install kubectl

# Work directory
WORKDIR /usr/src/app
