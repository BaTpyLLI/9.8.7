FROM cirrusci/wget:latest as builder

FROM scratch
WORKDIR /tmp/
COPY --from=builder /lib/ld-musl-x86_64.so.1 /lib/libssl.so.45 /lib/libcrypto.so.43 /lib/
COPY --from=builder /bin/sh /bin/ls          /bin/
COPY --from=builder /usr/bin/wget            /usr/bin/
COPY . /tmp

CMD /tmp/script https://www.google.com/
