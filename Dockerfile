FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential nodejs

WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "Puma", "-b", "0.0.0.0"]