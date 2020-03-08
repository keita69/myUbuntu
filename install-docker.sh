#!/bin/bash

echo "nameserver 8.8.8.8" > /etc/resolv.conf \
    && sed -i 's/cosmic/bionic/g' /etc/apt/sources.list \
    && echo "Package: *" > /etc/apt/preferences \
    && echo "Pin: release a=bionic" >> /etc/apt/preferences \
    && echo "Pin-Priority: 1001" >> /etc/apt/preferences 
apt-get update \
    && apt-get upgrade \
    && apt-get dist-upgrade 
apt-get install -y --allow-downgrades\
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository \
        "deb https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
        $(lsb_release -cs) \
        stable" \
    && apt-get update \
    && apt-get install -y docker-ce docker-ce-cli containerd.io
