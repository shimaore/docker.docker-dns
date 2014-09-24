#!/bin/bash
set -e
UUID=$(docker run -d -t -h docker-dns --name docker-dns \
  -p 172.17.42.1:53:53/udp \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v ${PWD}/log:/var/log/supervisor \
  shimaore/docker-dns)
UUID_SHORT=`echo $UUID | cut -b 1-12`
dig -t SRV +short \* @172.17.42.1             | grep -q "${UUID_SHORT}.local.localhost.docker-local"
dig -t SRV +short _domain._udp\* @172.17.42.1 | grep -q "${UUID_SHORT}.local.localhost.docker-local"
docker stop docker-dns
docker rm   docker-dns
echo OK
