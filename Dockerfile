FROM golang:alpine AS builder

WORKDIR /app

ENV GO111MODULE=on

ADD . /app

RUN go env -w GOPROXY=https://goproxy.cn,direct

RUN go mod download

RUN go build -o run .

CMD ["/app/run"]
