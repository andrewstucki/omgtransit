FROM node:8.0.0-alpine

RUN apk add --update \
      ruby \
      ruby-dev \
      libffi-dev \
      build-base && \
    gem install --no-rdoc --no-ri \
      listen \
      sass \
      compass && \
    npm install -g \
      grunt \
      grunt-cli && \
    apk del \
      build-base \
      libffi-dev \
      ruby-dev && \
    rm -rf /var/cache/apk/*

WORKDIR /application/frontend
