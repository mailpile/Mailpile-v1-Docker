#!/bin/bash
if [ "$1" == "daemon" ]; then
    DOCKER_HOW="-d"
elif [ "$1" == "run" ]; then
    DOCKER_HOW="-it"
else
    cat <<tac
Usage:

  $0 run     # Run in the foreground (displays console logs)
  $0 daemon  # Run in the background

Run Mailpile in a docker container, as the current user ($(id -un)).

The Mailpile instance will have access to your home directory and will read 
and write files in ~/.local/share/Mailpile/ as usual.  The environment
variables MAILPILE_PORT and MAILPILE_PROFILE can be set to deviate from the
default values.
tac
    exit 1
fi

MDU="$(id -un) $(id -u) $(id -g)"
MPP=${MAILPILE_PORT:-33411}

set -x
exec docker run $DOCKER_HOW --rm \
    -p $MPP:$MPP \
    -v /home/:/home/ \
    -e MAILPILE_PROFILE="${MAILPILE_PROFILE:-default}" \
    -e MAILPILE_DOCKER_USER="$MDU" \
    mailpile-v1 \
    docker-user-wrap mailpile --www="0.0.0.0:$MPP/" --wait
