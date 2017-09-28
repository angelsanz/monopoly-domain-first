FROM ruby:2.4.0

RUN mkdir /monopoly_system
WORKDIR /monopoly_system

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock


RUN bundle install --jobs 4
COPY . .
