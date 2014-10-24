FROM shimaore/nodejs

RUN apt-get install -y supervisor git

RUN mkdir -p /var/log/supervisor
COPY ./config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./config/config.js /etc/docker-dns.config.js

WORKDIR /opt
RUN git clone https://github.com/bnfinet/docker-dns.git
WORKDIR /opt/docker-dns
RUN npm install
RUN npm cache clear

EXPOSE 53/udp

CMD ["supervisord", "-n"]
