FROM alpine:latest

ENV BINARY_URL https://github.com/rust-lang/mdBook/releases/download/v0.4.25/mdbook-v0.4.25-x86_64-unknown-linux-musl.tar.gz

RUN apk add --no-cache curl tar

RUN curl -sSL $BINARY_URL -o mdbook.tar.gz && \
    tar -xzvf mdbook.tar.gz && \
    mv mdbook /usr/local/bin/mdbook && \
    chmod +x /usr/local/bin/mdbook

COPY . /handbook

CMD ["/usr/local/bin/mdbook", "serve", "-n", "0.0.0.0", "-p", "3000", "/handbook"]

