# Stage 0: Build
FROM debian:9-slim

RUN apt-get update
RUN apt-get install -y 

# Stage 1: Runtime
FROM debian:9-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      curl ca-certificates iproute2 && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt

# @安装docker
FROM debian:9-slim

RUN apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && apt update
RUN apt install docker-ce docker-ce-cli containerd.io
RUN service docker restart 
RUN systemctl enable docker

COPY run.sh /

EXPOSE 80 3763
VOLUME /data
WORKDIR /data
ADD start.sh /run.sh
RUN chmod +x /run.sh

CMD /run.sh
