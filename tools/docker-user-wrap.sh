#!/bin/bash
#
# This script creates a user with a name/uid/gid matching that of the
# host, so Mailpile can access the user's home directory.
#
set -e
#set -x
if [ "$MAILPILE_DOCKER_USER" != "" ]; then
    echo $MAILPILE_DOCKER_USER |while read _USERNAME _UID _GID; do
        groupadd -g $_GID $_USERNAME
        useradd -u $_UID -g $_GID -d /home/$_USERNAME $_USERNAME --no-create-home
        if [ "$MAILPILE_PROFILE" == "" ]; then
            exec su - $_USERNAME -c "$*"
        else
            exec su - $_USERNAME -c "MAILPILE_PROFILE=\"$MAILPILE_PROFILE\" $*"
        fi
    done
fi
