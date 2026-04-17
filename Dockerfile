FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    nginx \
    iputils-ping \
    net-tools \
    python3 \
    iproute2 \
