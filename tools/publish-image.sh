#!/bin/bash
docker login
docker push mailpile/mailpile-v1
docker logout
