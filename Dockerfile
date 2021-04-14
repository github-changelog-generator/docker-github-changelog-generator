FROM ruby:2.6.4-alpine3.9

LABEL maintainer="ferrari.marco@gmail.com"

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

RUN apk add --no-cache \
  git=2.20.4-r0

WORKDIR /
COPY Gemfile Gemfile
RUN gem install bundler --version $(cat Gemfile | grep bundler | awk -F "'" '{print $4}') \
  && bundle install --system \
  && gem uninstall bundler \
  && rm Gemfile

ENV SRC_PATH /usr/local/src/your-app
RUN mkdir -p "${SRC_PATH}"

VOLUME [ "$SRC_PATH" ]
WORKDIR $SRC_PATH

ENTRYPOINT ["github_changelog_generator"]
CMD ["--help"]
