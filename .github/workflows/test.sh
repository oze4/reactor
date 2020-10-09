#!/usr/bin/env bash

# ================================================= #
#                                                   #
# Thanks to https://github.com/gammazero/workerpool #
#                                                   #
# ================================================= #

set -e
echo "" > coverage.txt

for d in $(go list ./... | grep -v vendor); do
    go test -race -coverprofile=profile.out -covermode=atomic $d
    if [ -f profile.out ]; then
        cat profile.out >> coverage.out
        rm profile.out
    fi
done