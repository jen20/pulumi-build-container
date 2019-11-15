#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o xtrace

SCRIPT_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "${SCRIPT_ROOT}/utils.sh"

export DEBIAN_FRONTEND=noninteractive

apt-get update

apt-get install -y \
    curl \
    git \
    gnupg2 \
    jq \
    software-properties-common

add-apt-repository universe
apt-get install -y \
    apt-transport-https

# Install GCC from APT for building cgo
apt-get install -y --no-install-recommends \
	g++ \
	gcc \
	libc6-dev \
	make \
	pkg-config

apt-get clean
apt-get autoclean
rm -rf /var/lib/apt/lists/*