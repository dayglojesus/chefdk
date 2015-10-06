FROM ubuntu
MAINTAINER Brian Warsing <dayglojesus@gmail.com>

ENV REFRESHED_AT 2015-10-03
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -yq install \
        git \
        vim \
        curl \
        tree \
        ctags && \
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    curl -L https://www.opscode.com/chef/install.sh | sudo bash -s -- -P chefdk && \
    /opt/chefdk/embedded/bin/gem install -N \
        pry \
        rmate && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD dotfiles/*.* /root/

VOLUME ["/root/data"]

ENV HOME=/root
WORKDIR /root

ENTRYPOINT /bin/bash -l
