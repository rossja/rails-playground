# syntax=docker/dockerfile:1

FROM ruby:3
LABEL maintainer "Jason Ross <algorythm@gmail.com>"

RUN apt-get update -qq && apt-get install -y nodejs npm postgresql-client
RUN npm install -g yarn 

WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install

RUN git config --global init.defaultBranch main
CMD ["rails", "new", ".", "--force", "--database=postgresql"]