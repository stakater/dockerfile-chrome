FROM openjdk:8

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories
RUN apk add --update --no-cache chromium
RUN wget https://chromedriver.storage.googleapis.com/2.32/chromedriver_linux64.zip -P /opt/
RUN unzip /opt/chromedriver_linux64.zip