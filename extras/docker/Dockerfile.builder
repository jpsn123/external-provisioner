FROM golang:alpine
LABEL maintainers="Kubernetes Authors"
LABEL description="CSI Provisioner"

RUN apk add --no-cache git openssh make bash
RUN git clone https://github.com/jpsn123/external-provisioner.git; \
    cd external-provisioner; \
    make;
