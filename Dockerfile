FROM ruby:2.3.1-alpine

RUN apk add --update alpine-sdk && rm -rf /var/cache/apk/*
RUN apk add --update imagemagick-dev imagemagick && rm -rf /var/cache/apk/*
RUN apk add --update nodejs curl-dev curl sqlite-dev mariadb-dev libxml2-dev libxslt-dev linux-headers  && rm -rf /var/cache/apk/*

RUN wget http://packages.groonga.org/source/groonga/groonga-6.0.5.tar.gz && tar xvzf groonga-6.0.5.tar.gz && cd groonga-6.0.5 && ./configure && make -j9 && make install && cd .. && rm -rf groonga-6.0.5 groonga-6.0.5.tar.gz

RUN gem install foreman bundler rmagick

