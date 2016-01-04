FROM ubuntu:15.10

RUN useradd -d /home/letsencrypt -s /bin/false letsencrypt
RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"

RUN apt-get install -y nginx git vim

# Bootstrap client dependencies
RUN git clone https://github.com/letsencrypt/letsencrypt /home/letsencrypt/stock &&\
  cd /home/letsencrypt/stock && \
  ./bootstrap/install-deps.sh

RUN apt-get install -y dnsmasq

# track changes in nginx config dir
RUN git config --global user.email "auto@mated.com" &&\
    git config --global user.name "Automated"

RUN cd /etc/nginx/ && \
    git init . &&\
    git add . &&\
    git commit -m "Stock config files"

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Use dnsmasq to bypass DNS self verification on the client
RUN echo "user=root" >> /etc/dnsmasq.conf &&\
    echo "address=/letsencrypt.you/127.0.0.1" >> /etc/dnsmasq.conf
RUN echo "nameserver 127.0.0.1" >> /etc/resolv.conf

COPY ./entrypoint.sh /root/entrypoint
COPY ./letsencrypt-proxy /etc/nginx/sites-enabled/letsencrypt-proxy
COPY ./auth-and-install.sh /home/letsencrypt/bin/auth-and-install
COPY ./certonly.sh /home/letsencrypt/bin/certonly
COPY ./deploy-nginx.sh /home/letsencrypt/bin/deploy-nginx

VOLUME /etc/letsencrypt
VOLUME /home/letsencrypt/client
VOLUME /root/letsencrypt-quickstart

WORKDIR /root/letsencrypt-quickstart
ENTRYPOINT [ "/root/entrypoint" ]
CMD [ "/bin/bash" ]
