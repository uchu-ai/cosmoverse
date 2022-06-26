FROM golang:1.18-alpine3.16

WORKDIR /usr/src/app

RUN apk add git make gcc musl-dev linux-headers jq
RUN git clone -b v7.0.2 https://github.com/cosmos/gaia \
      && cd gaia \
      && make install \
      && cd .. \
      && rm -Rf gaia

COPY ./wait_for_next_block /bin/
RUN chmod +x /bin/wait_for_next_block
