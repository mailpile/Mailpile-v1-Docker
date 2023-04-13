# Mailpile v1 legacy Docker images

Development of Mailpile v1 has stopped, and it has become hard to
install on modern distributions due to its requirements (in particular
Python 2.x) being unmaintained.

These Docker images and scripts make it relativey easy to run legacy
Mailpile on a modern Linux machine. These are provided for historic
reasons, and to ensure users of Mailpile v1 retain access to their data.

**NOTE:** the contents of the Docker images are themselves obsolete and
for security reasons this should not be relied on in production or for
new installations.


## How to run from Docker Hub

This assumes you already have `git` and `docker` installed.

    $ git clone https://github.com/mailpile/Mailpile-v1-Docker
    $ cd Mailpile-v1-Docker

    # Display some instructions
    $ ./mailpile-v1.sh

    # Launch Mailpile
    $ ./mailpile-v1.sh run

**Note:** This will pull the latest image from Docker Hub and launch it.
Yes this is a binary blob, thank you for trusting me!


## How to build and run your own images:

This assumes you already have `git` and `docker` installed.

    $ git clone https://github.com/mailpile/Mailpile-v1-Docker
    $ cd Mailpile-v1-Docker

    # Build the Docker image
    $ ./tools/build-image.sh

    # Run it!
    $ ./mailpile-v1.sh run

This builds an image by installing Mailpile packages from the project's
Debian repository. This may fail at some point, if the repo is taken
offline, keys expire or the Debian image we build upon become unusable.

