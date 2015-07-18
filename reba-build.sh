#!/usr/bin/env bash

eval "$(boot2docker shellinit)"
docker build -t prideout/reba .
