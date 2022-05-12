# Build Stage
FROM --platform=linux/amd64 ubuntu:20.04 as builder

## Install build dependencies.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y cmake

## Add source code to the build stage.
ADD . /spectrophoto
WORKDIR /spectrophoto

## TODO: ADD YOUR BUILD INSTRUCTIONS HERE.
RUN gcc ./spectrophoto.c -o spectrophoto -std=c99 -lm -O3 -Wall

#Package Stage
FROM --platform=linux/amd64 ubuntu:20.04

## TODO: Change <Path in Builder Stage>
COPY --from=builder /spectrophoto/spectrophoto /
