# Pulumi Build Container

This repository contains a `Dockerfile` for building a container image containing all of the build dependencies for Pulumi and the Pulumi provider ecosystem.

## Building

```shell
$ docker build -t jen20/pulumi-build-container:latest .
```

## CI and Releases

Snapshot builds of the container are built with every push to `master` and published to `jen20/pulumi-build-container` on Docker Hub.

Release builds are made when tags of the form `vX` are pushed, and published to `jen20/pulumi-build-container` on Docker Hub.
