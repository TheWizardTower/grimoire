FROM fedora
MAINTAINER Adam McCullough <merlinfmct87@gmail.com>

RUN curl -sSL https://s3.amazonaws.com/download.fpcomplete.com/fedora/23/fpco.repo | \
    sudo tee /etc/yum.repos.d/fpco.repo && \
    dnf install -y stack

ADD . /root/Haskell99Problems

WORKDIR /root/Haskell99Problems

RUN stack build
