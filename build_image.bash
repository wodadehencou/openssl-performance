#!/bin/bash

 docker buildx  build --progress plain --platform=linux/amd64  -t openssl-performance:latest .
