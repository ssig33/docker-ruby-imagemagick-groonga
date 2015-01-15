FROM debian:sid

RUN echo deb http://ftp.jp.debian.org/debian/ sid main > /etc/apt/sources.list && echo deb-src http://ftp.jp.debian.org/debian/ sid main >> /etc/apt/sources.list && echo "deb http://packages.groonga.org/debian/ unstable main"  >> /etc/apt/sources.list && echo "deb-src http://packages.groonga.org/debian/ unstable main" >> /etc/apt/sources.list

RUN apt-get update && apt-get install aptitude git wget -y && aptitude -V -D -y --allow-untrusted install groonga-keyring && apt-get update && apt-get install nginx libgroonga-dev groonga libssl-dev libsqlite3-dev libmysqlclient-dev libncurses5-dev libreadline-dev libyaml-dev libsqlite3-dev libxml2-dev libxslt-dev libsasl2-dev libsasl2-2 libv8-dev libv8-dev nodejs libgdbm-dev -y && apt-get build-dep imagemagick -y && apt-get build-dep ruby -y && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN apt-get update && apt-get install libffi-dev libmagickwand-dev -y && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN wget http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.bz2 && tar xvf ruby-2.2.0.tar.bz2 && cd  ruby-2.2.0 && ./configure && make -j4 && make install && cd .. && rm -rf  ruby-2.2.0 && rm -rf  ruby-2.2.0.tar.gz

RUN apt-get update && apt-get install imagemagick -y && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN gem install foreman bundler rmagick

