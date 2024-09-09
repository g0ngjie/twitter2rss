FROM golang:alpine AS builder

WORKDIR /build

ENV GO111MODULE=on

COPY . .

RUN go env -w GOPROXY=https://goproxy.cn,direct

RUN go mod download

RUN go build -o run .

FROM alpine:latest AS final

WORKDIR /app

COPY --from=builder /build/run /app

EXPOSE 8000

CMD ["/app/run"]
