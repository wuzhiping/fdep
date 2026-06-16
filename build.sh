build.sh
#!/usr/bin/env bash
set -euo pipefail
#

VERSION=$(date +%Y.%-m.%-d)

echo "Building version: $VERSION"

sudo -E docker build -t shawoo/all-in-one-sandbox:$VERSION . -f Dockerfile  --no-cache --pull

# just build up2date
exit 0

docker rm -f fedp
docker run --name fdep -it -d --security-opt seccomp=unconfined -p 3888:8080 \
        -v $PWD/lab:/opt/jupyter/src \
        -v $PWD/openclaw:/home/gem/.openclaw \
        -v $PWD/pi:/home/gem/.pi \
        -v $PWD/hermes:/home/gem/.hermes \
        shawoo/all-in-one-sandbox:$VERSION
