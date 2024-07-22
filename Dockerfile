FROM gcc AS builder
# FROM gcc

RUN apt-get update && apt-get install -y --no-install-recommends cmake 

COPY . /app

RUN cd /app && cmake . && make


FROM debian:bookworm-slim
# COPY ./MyOpenSSLApp /

RUN apt-get update && apt-get install -y --no-install-recommends openssl && rm -rf /var/lib/apt/lists/*

COPY --from=builder /app/MyOpenSSLApp /
