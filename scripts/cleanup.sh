#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o xtrace

apt-get clean
apt-get autoclean
rm -rf /build-scripts
rm -rf /var/lib/apt/*
