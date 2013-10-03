

# ServiceStack Nginx Mono_fastcgi Host
#
# VERSION 0.01

FROM	lopter/raring-base
MAINTAINER Pauli Price "pauli.price@gmail.com"

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu raring main universe" > /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y mono-complete
RUN apt-get install -y mono-fastcgi-server4
RUN apt-get install -y inotify-tools nginx apache2 openssh-server
RUN apt-get install -y git ca-certificates
RUN apt-get install -y curl
RUN curl -O -L  http://nuget.org/nuget.exe
RUN mv nuget.exe /usr/local/bin

RUN git config --global http.sslVerify true
RUN git config --global http.sslCAinfo  /etc/ssl/certs/ca-certificates.crt
RUN mkdir -p  /var/www/
RUN mkdir -p /var/log/mono
RUN git clone https://github.com/MarFarMa/ServiceStack.Hello.git /var/www/hello
RUN cp /var/www/hello/lib/Microsoft.Build.dll /usr/local/bin
RUN mozroots --import --sync
RUN cd /var/www/hello
RUN nuget install /var/www/hello/packages.config
RUN xbuild /var/www/hello/ServiceStack.Hello.sln
