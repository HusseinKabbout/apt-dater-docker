FROM ubuntu:20.04

RUN apt-get update && apt-get upgrade -y

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Zurich

RUN apt-get install apt-dater git vim -y

RUN adduser ubuntu --home /home/ubuntu
RUN mkdir -p /home/ubuntu/.config/apt-dater/
RUN chown 1000:1000 -R /home/ubuntu/.config/

ADD entrypoint.sh /home/ubuntu/entrypoint.sh
RUN chown 1000:1000 /home/ubuntu/entrypoint.sh
RUN chmod +x /home/ubuntu/entrypoint.sh

WORKDIR /home/ubuntu
USER ubuntu

ENTRYPOINT ["/home/ubuntu/entrypoint.sh"]

