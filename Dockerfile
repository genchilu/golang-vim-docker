FROM ubuntu:16.04

RUN apt-get update -y
RUN apt-get install -y build-essential sudo git wget curl vim


# env vars
ENV GOPATH /goprojects
ENV PATH $PATH:/usr/local/go/bin:/goprojects/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games


# vim plugin for golang & oh-my-zsh
RUN git clone https://github.com/genchilu/dotfile.git && cd dotfile && make golang && cd .. && rm -rf dotfile

ENV LANG C.UTF-8 
