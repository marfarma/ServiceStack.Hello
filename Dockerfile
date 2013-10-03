

# ServiceStack Nginx Mono_fastcgi Host
#
# VERSION 0.01


FROM	lopter/raring-base
MAINTAINER Pauli Price "pauli.price@gmail.com"

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu raring main universe" > /etc/apt/sources.list

RUN apt-get update
#RUN sed -i 's/http/ftp/g' /etc/apt/sources.list 


RUN apt-get install -y --fix-missing mono-complete
RUN apt-get install -y mono-fastcgi-server4
RUN apt-get install -y inotify-tools nginx apache2 openssh-server
RUN apt-get install -y git 
RUN mkdir -p  /var/www/
RUN mkdir -p /var/log/mono
