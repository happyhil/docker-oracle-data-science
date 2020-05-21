#!/usr/bin/env bash

# SET THE FOLLOWING VARIABLES
USERNAME=happyhill # docker hub username
IMAGE=oracle-datascience # image name

docker build -t $USERNAME/$IMAGE:latest -f oracle-datascience/Dockerfile .
