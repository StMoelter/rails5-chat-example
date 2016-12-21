FROM ruby:2.3.3-alpine

RUN apk --update add --virtual build-dependencies build-base ruby-dev sqlite-dev nodejs tzdata bash

WORKDIR /app

COPY Gemfile ./
COPY Gemfile.lock ./

RUN bundle install

COPY . ./

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]