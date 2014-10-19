FROM debian:sid

RUN echo deb http://ftp.jp.debian.org/debian/ sid main > /etc/apt/sources.list && echo deb-src http://ftp.jp.debian.org/debian/ sid main >> /etc/apt/sources.list && echo "deb http://packages.groonga.org/debian/ unstable main"  >> /etc/apt/sources.list && echo "deb-src http://packages.groonga.org/debian/ unstable main" >> /etc/apt/sources.list

RUN apt-get update && apt-get install aptitude wget -y && aptitude -V -D -y --allow-untrusted install groonga-keyring && apt-get update && apt-get install nginx libgroonga-dev groonga -y && apt-get build-dep imagemagick ruby -y && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN wget ftp://ftp.kddlabs.co.jp/graphics/ImageMagick/releases/ImageMagick-6.8.9-8.tar.xz && tar xvf ImageMagick-6.8.9-8.tar.xz && cd ImageMagick-6.8.9-8 && ./configure && make -j4 && make install && cd .. && rm -rf ImageMagick*

RUN wget http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.3.tar.gz && tar xvf ruby-2.1.3.tar.gz && cd  ruby-2.1.3 && ./configure && make -j4 && make install && cd .. && rm -rf  ruby-2.1.3 && rm -rf  ruby-2.1.3.tar.gz

gem install foreman

