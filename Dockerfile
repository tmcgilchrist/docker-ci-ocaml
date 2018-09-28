FROM ubuntu:xenial
MAINTAINER Tim McGilchrist <timmcgil@gmail.com>

ARG OCAML_VERSION

ENV LC_ALL=en_US.utf8
ENV TERM=xterm-256color

RUN apt-get update -y \
        && apt-get install -y language-pack-en dos2unix software-properties-common apt-transport-https autoconf automake build-essential libtool make gcc g++ libgmp-dev ncurses-dev libtinfo-dev python3 xz-utils dh-autoreconf libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev

RUN sh <(curl -sL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)
RUN opam switch ${OCAML_VERSION}
RUN eval $(opam config env) && opam update && opam install -y dune
