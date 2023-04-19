FROM ruby:3.1.4

ARG NODE_VERSION='18'
ENV APP_ROOT /app

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y build-essential libpq-dev nodejs yarn

ADD Gemfile $APP_ROOT/Gemfile
ADD Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install

COPY . $APP_ROOT

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
