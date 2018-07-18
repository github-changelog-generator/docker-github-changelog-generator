FROM ruby:2.5.1-alpine3.7

LABEL maintainer "ferrari.marco@gmail.com"
RUN apk add --no-cache git

COPY Gemfile Gemfile
RUN gem install bundler --version $(cat Gemfile | grep bundler | awk -F "'" '{print $4}') \
  && bundle install --system \
  && gem uninstall bundler

ENV SRC_PATH /usr/local/src/your-app
RUN mkdir -p $SRC_PATH

VOLUME [ "$SRC_PATH" ]
WORKDIR $SRC_PATH

CMD ["--help"]
ENTRYPOINT ["github_changelog_generator"]
