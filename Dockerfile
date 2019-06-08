ARG VERSION
FROM ruby:2.6.3-alpine3.9

LABEL maintainer "ferrari.marco@gmail.com"

RUN apk add --no-cache git
RUN gem install github_changelog_generator -v "$VERSION"

CMD ["--help"]
ENTRYPOINT ["github_changelog_generator"]
