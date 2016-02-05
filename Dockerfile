FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y build-essential git wget curl ctags vim

# env vars

ENV GOPATH /goprojects
ENV PATH $PATH:/goprojects/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

# go 1.5
RUN wget -qO- https://storage.googleapis.com/golang/go1.5.linux-amd64.tar.gz | tar -C /usr/local -xzf -

# GOPATH
RUN mkdir -p /goprojects
RUN mkdir -p /goprojects/bin
RUN mkdir -p /goprojects/pkg
RUN mkdir -p /goprojects/src
RUN mkdir -p /goprojects/src/github.com
RUN mkdir -p /goprojects/src/github.com/genchilu

# vim plugin for golang & oh-my-zsh
RUN git clone https://github.com/genchilu/dotfile.git && cd dotfile && bash setup.sh && cd .. && rm -rf dotfile
RUN git clone https://github.com/fatih/vim-go.git /root/.vim/bundle/vim-go
RUN go get -u github.com/jstemmer/gotags
RUN git clone https://github.com/majutsushi/tagbar.git /root/.vim/bundle/tagbar
RUN go get github.com/nsf/gocode
COPY vimrc /root/vimrc
RUN cat /root/vimrc >> /root/.vimrc

ENV LANG C.UTF-8 
