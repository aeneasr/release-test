# To compile this image manually run:
#
# $ GO111MODULE=on GOOS=linux GOARCH=amd64 go build && docker build -t oryd/hydra:v1.0.0-rc.7_oryOS.10 . && rm hydra
FROM alpine:3.9

RUN apk add -U --no-cache ca-certificates

FROM scratch

COPY --from=0 /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY release-test /usr/bin/release-test
COPY .releaser/LICENSE.txt /LICENSE.txt

ENTRYPOINT ["release-test"]
CMD ["version"]
