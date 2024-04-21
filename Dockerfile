FROM golang:1.22.2-alpine3.19 as build

ARG CGO_ENABLED=0

RUN apk add --no-cache \
      patch

RUN wget https://raw.githubusercontent.com/kubernetes/ingress-gce/master/cmd/404-server/server.go

COPY 501.patch ./

RUN patch -p0 -i 501.patch

RUN go build server.go

FROM scratch

COPY --from=build /go/server /server

USER 65534:65534

ENTRYPOINT ["/server"]
