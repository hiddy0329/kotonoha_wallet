FROM ruby:3.4.0

RUN apt-get update -qq
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
&& apt-get install -y nodejs
RUN npm install --global yarn

WORKDIR /kotonoha_wallet

#Gemfile,Gemfile.lockをローカルからCOPY
COPY gemfile gemfile.lock /kotonoha_wallet/

#コンテナ内にコピーしたGemfileを用いてbundel install
RUN bundle install

#railsを起動する
CMD ["rails", "server", "-b", "0.0.0.0"]