FROM openjdk:8

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
  && apt-get -y install \
       dumb-init gnupg wget ca-certificates apt-transport-https \
       ttf-wqy-zenhei \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

ARG GOOGLE_CHROME_BETA_VERSION=67.0.3396.40-1

RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
  && apt-get update -y \
  && apt-get -y install google-chrome-beta=${GOOGLE_CHROME_BETA_VERSION} \
  && rm /etc/apt/sources.list.d/google-chrome.list \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*
  