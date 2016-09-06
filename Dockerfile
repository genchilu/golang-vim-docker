FROM ubuntu:16.04

RUN apt-get update -y
RUN apt-get install -y build-essential sudo git wget curl vim

#install go 1.7
RUN wget https://storage.googleapis.com/golang/go1.7.linux-amd64.tar.gz && \
tar -C /usr/local -xzf go1.7.linux-amd64.tar.gz && \
rm -rf go1.7.linux-amd64.tar.gz

# env vars
ENV GOPATH /goprojects
ENV PATH $PATH:/usr/local/go/bin:/goprojects/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

# GOPATH
RUN mkdir -p /goprojects && mkdir -p /goprojects/bin && mkdir -p /goprojects/pkg\
&& mkdir -p /goprojects/src && mkdir -p /goprojects/src/github.com && mkdir -p /goprojects/src/github.com/genchilu

# vim plugin for golang & oh-my-zsh
RUN git clone https://github.com/genchilu/dotfile.git && cd dotfile && bash setup.sh && cd .. && rm -rf dotfile
RUN git clone https://github.com/fatih/vim-go.git /root/.vim/bundle/vim-go
RUN go get -u github.com/jstemmer/gotags
RUN git clone https://github.com/majutsushi/tagbar.git /root/.vim/bundle/tagbar
RUN go get github.com/nsf/gocode
COPY vimrc /root/vimrc
RUN cat /root/vimrc >> /root/.vimrc

ENV LANG C.UTF-8 
