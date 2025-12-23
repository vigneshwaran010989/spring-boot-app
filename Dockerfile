FROM maven:3.8.6-openjdk-11

USER root

# Policy to block service starts
RUN echo '#!/bin/sh\nexit 101' > /usr/sbin/policy-rc.d && chmod +x /usr/sbin/policy-rc.d

# Install Docker using docker.io (no external repos)
RUN apt-get update && \
    apt-get install -y docker.io && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

WORKDIR /app
