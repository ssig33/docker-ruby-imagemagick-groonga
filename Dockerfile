FROM ruby:2.3.3-alpine

RUN apk add --update alpine-sdk && rm -rf /var/cache/apk/*
RUN apk add --update imagemagick-dev imagemagick && rm -rf /var/cache/apk/*
RUN apk add --update nodejs curl-dev curl sqlite-dev mariadb-dev libxml2-dev libxslt-dev linux-headers  && rm -rf /var/cache/apk/*

RUN wget http://packages.groonga.org/source/groonga/groonga-6.1.1.tar.gz && tar xvzf groonga-6.1.1.tar.gz && cd groonga-6.1.1 && ./configure && make -j9 && make install && cd .. && rm -rf groonga-6.1.1 groonga-6.1.1.tar.gz

RUN gem install foreman bundler tzinfo-data
