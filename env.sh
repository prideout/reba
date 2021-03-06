#!/usr/bin/env bash

INSTNAME="$1"
MOUNTARG="-v $(pwd):/reba"

echo "Mapping $(pwd) to /reba."
eval "$(boot2docker shellinit)" > /dev/null 2>&1
docker run -itd $MOUNTARG --name=$INSTNAME prideout/reba bash
alias reba="docker start $INSTNAME && docker attach $INSTNAME"
alias reba-kill="docker rm -f $INSTNAME"
