FROM ruby:2.4.1-alpine

RUN apk add --update alpine-sdk ca-certificates && rm -rf /var/cache/apk/*
RUN apk add --update imagemagick-dev imagemagick && rm -rf /var/cache/apk/*
ENV SSL_CERT_FILE /etc/ssl/certs/ca-certificates.crt
RUN apk add --update nodejs curl-dev curl sqlite-dev mariadb-dev libxml2-dev libxslt-dev linux-headers  && rm -rf /var/cache/apk/*

RUN wget http://packages.groonga.org/source/groonga/groonga-7.0.4.tar.gz && tar xvzf groonga-7.0.4.tar.gz && cd groonga-7.0.4 && ./configure && make -j9 && make install && cd .. && rm -rf groonga-7.0.4 groonga-7.0.4.tar.gz

RUN gem install foreman bundler tzinfo-data
