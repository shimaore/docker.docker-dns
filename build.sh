#!/bin/sh
set -e

docker build -t shimaore/docker-dns .

echo "Tests"
(cd test && for test in ./*.sh; do "$test"; done)
