FROM ruby:2.7-alpine

RUN apk add --update alpine-sdk ca-certificates && rm -rf /var/cache/apk/*
RUN apk add --update imagemagick-dev imagemagick && rm -rf /var/cache/apk/*
ENV SSL_CERT_FILE /etc/ssl/certs/ca-certificates.crt
RUN apk add --update nodejs curl-dev curl sqlite-dev mariadb-dev libxml2-dev libxslt-dev linux-headers  && rm -rf /var/cache/apk/*

RUN wget http://packages.groonga.org/source/groonga/groonga-9.1.2.tar.gz && tar xvzf groonga-9.1.2.tar.gz && cd groonga-9.1.2 && ./configure && make -j9 && make install && cd .. && rm -rf groonga-9.1.2 groonga-9.1.2.tar.gz

RUN gem install foreman bundler tzinfo-data
