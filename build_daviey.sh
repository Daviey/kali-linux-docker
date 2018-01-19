#!/bin/bash -x

BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
VERSION="latest"
VCS_URL=$(git config --get remote.origin.url)
VCS_REF=$(git rev-parse --short HEAD)

docker build --squash --rm -t daviey/kali-linux:$VERSION \
    --build-arg BUILD_DATE=$BUILD_DATE \
    --build-arg VERSION=$VERSION \
    --build-arg VCS_URL=$VCS_URL \
    --build-arg VCS_REF=$VCS_REF . &&\
echo "Build OK" || echo "Build failed!"
