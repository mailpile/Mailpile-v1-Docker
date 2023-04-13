#!/bin/bash
set -e
set -x 
docker build -t mailpile-v1 -f ./Dockerfile.v1 .
docker tag mailpile-v1 'mailpile/mailpile-v1'
