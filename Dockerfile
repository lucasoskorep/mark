FROM golang:1.19.6 as builder
ENV GOPATH="/go"
WORKDIR /go/src/github.com/lucasoskorep/mark
COPY / .
RUN make get \
&& make build

FROM alpine:3.17
RUN apk --no-cache add ca-certificates bash sed git
COPY --from=builder /go/src/github.com/lucasoskorep/mark/mark /bin/
WORKDIR /docs
