FROM ubuntu:18.04
WORKDIR /home
COPY agent.jar .
RUN apt-get update -y && \
    apt-get install \
    curl \
    openjdk-11-jdk \
    inetutils-ping \
    git maven -y
RUN adduser --disabled-password --gecos "" jenkins
RUN curl -fsSL https://get.docker.com/ | sh
RUN usermod -aG docker jenkins
