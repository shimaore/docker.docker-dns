A `docker-dns` image with configuration in `/etc/docker-dns.config.js`.

Start with:

    docker run -d -t -h docker-dns --name docker-dns \
      -p 172.17.42.1:53:53/udp \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v ${PWD}/log:/var/log/supervisor \
      shimaore/docker-dns
