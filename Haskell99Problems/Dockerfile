FROM fpco/stack-build
MAINTAINER Adam McCullough <merlinfmct87@gmail.com>

ADD . /root/Haskell99Problems

WORKDIR /root/Haskell99Problems

RUN stack setup && \
stack build        && \
stack build --test && \
stack exec Haskell99Problems-exe
