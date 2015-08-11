## Dockerfile for generic vim 7.4.
FROM debian:jessie
MAINTAINER Paul LaMar <pal3@outlook.com>

ENV LANG     C.UTF-8

RUN apt-get update && \
    apt-get install -y --no-install-recommends vim && \
    apt-get clean

ADD vimrc /root/.vimrc

CMD /bin/bash
