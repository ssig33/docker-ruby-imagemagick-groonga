FROM alpine:edge

RUN apk add --update ruby ruby-dev ruby-bundler && rm -rf /var/cache/apk/*
RUN apk add --update ruby-io-console &&  rm -rf /var/cache/apk/*
RUN apk add --update imagemagick-dev imagemagick && rm -rf /var/cache/apk/*
RUN apk add --update alpine-sdk && rm -rf /var/cache/apk/*
RUN apk add --update ruby-rdoc ruby-irb && rm -rf /var/cache/apk/*
RUN wget http://packages.groonga.org/source/groonga/groonga-5.1.1.tar.gz && tar xvzf groonga-5.1.1.tar.gz && cd groonga-5.1.1 && ./configure && make -j9 && make install && cd .. && rm -rf groonga-5.1.1 groonga-5.1.1.tar.gz

RUN gem install foreman bundler rmagick

