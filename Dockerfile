FROM ruby:2.4-alpine3.7

LABEL maintainer "ferrari.marco@gmail.com"
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

ENV BUNDLER_VERSION 1.16.1

COPY Gemfile Gemfile
RUN gem install bundler --version $BUNDLER_VERSION \
  && bundle install --system \
  && gem uninstall bundler

ENV SRC_PATH /usr/local/src/your-app
RUN mkdir -p $SRC_PATH

VOLUME [ "$SRC_PATH" ]
WORKDIR $SRC_PATH

CMD ["--help"]
ENTRYPOINT ["github_changelog_generator"]
