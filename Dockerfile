FROM ubuntu:bionic

LABEL description="Pulumi Build Container"
LABEL maintainer="james@jen20.com"

# Copy provisioning scripts
ADD --chown=root scripts/ /build-scripts

# Install various packages
RUN /build-scripts/install-packages.sh

# Install Go compiler and linter
RUN GOLANG_VERSION=1.13.4 \
    GOLANG_SHA256=692d17071736f74be04a72a06dab9cac1cd759377bd85316e52b2227604c004c \
    GOLANGCI_LINT_VERSION=1.18.0 \
    /build-scripts/install-go.sh

# Install Node.js and Yarn
RUN NODE_VERSION=8.x \
    NODE_DISTRO=bionic \
    YARN_VERSION=1.19.2 \
    /build-scripts/install-node.sh

# Install Python and accoutrements
RUN PYTHON_VERSION=3.7 \
    PIPENV_VERSION=2018.11.26 \
    AWSCLI_VERSION=1.14.30 \
    WHEEL_VERSION=0.33.6 \
    TWINE_VERSION=1.13.0 \
    /build-scripts/install-python.sh

# Install Dotnet
RUN DOTNET_SDK_VERSION=3.1 \
    /build-scripts/install-dotnet.sh

# Install Pulumi build tools
RUN TF2PULUMI_VERSION=0.6.0 \
    TF2PULUMI_SHA256=9a8fdfc590f8813a5ccaf1bfb1abba3064f109cce34f47fc66a34adaaa44c50f \
    /build-scripts/install-pulumi-tools.sh

# Clean up
RUN /build-scripts/cleanup.sh

# Set various required environment variables
ENV GOPATH=/go \
    PATH=/go/bin:/root/.pulumi/bin:/usr/local/go/bin:/root/.yarn/bin/:$PATH \
    DOTNET_CLI_TELEMETRY_OPTOUT=1 \
    DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
