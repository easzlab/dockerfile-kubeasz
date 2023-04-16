# Dockerfile for building images to run kubeasz in a container
# @author:  gjmzj
# @repo:     https://github.com/easzlab/kubeasz

FROM easzlab/ansible:2.14.4-lite

ARG KUBEASZ_VER=3.3.2

ENV TZ="Asia/Shanghai"

RUN set -x \
      # Downloading kubeasz
    && wget https://github.com/easzlab/kubeasz/archive/refs/tags/"$KUBEASZ_VER".tar.gz \
    && tar zxf ./"$KUBEASZ_VER".tar.gz \
    && mv kubeasz-"$KUBEASZ_VER" /etc/kubeasz \
    && ln -s -f /etc/kubeasz/ezctl /usr/bin/ezctl \
    && ln -s -f /etc/kubeasz/ezdown /usr/bin/ezdown \
    && ln -s -f /usr/local/bin/python3.11 /usr/bin/python \
    && ln -s -f /usr/local/bin/python3.11 /usr/bin/python3 \
      # Cleaning
    && rm -rf ./"$KUBEASZ_VER".tar.gz
