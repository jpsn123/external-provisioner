#!/bin/sh

docker build --rm -f Dockerfile.builder -t provisioner:builder .
docker run --rm --privileged -v $PWD:/host provisioner:builder cp /go/external-provisioner/bin/csi-provisioner /host/csi-provisioner
sudo chown $USER csi-provisioner
docker build --rm -t docker.io/jutze/csi-provisioner .
docker rmi provisioner:builder
rm -f csi-provisioner
