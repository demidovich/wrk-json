# Based on the http://czerasz.com/2015/07/19/wrk-http-benchmarking-tool-example/

FROM alpine:3.12.0

RUN apk add \
        wrk \
        lua \
        lua-dev \
        lua-cjson \
        lua-inspect \
    && ulimit -c -m -s -t unlimited

VOLUME [ "/data" ]
WORKDIR /data

ENTRYPOINT ["/usr/bin/wrk"]
