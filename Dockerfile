# syntax=docker/dockerfile:1

FROM ruby:3.0

RUN apt-get update -qq && apt-get install -y postgresql-client

ENV BUNDLER_VERSION=2.2.17

RUN gem install bundler -v 2.2.17

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
