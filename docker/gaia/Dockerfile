FROM golang:1.18-alpine3.16

WORKDIR /usr/src/app

RUN apk add git make gcc musl-dev linux-headers
RUN git clone -b v7.0.2 https://github.com/cosmos/gaia
RUN cd gaia && make install
