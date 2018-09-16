FROM debian:stretch
ARG DEBIAN_FRONTEND=noninteractive

EXPOSE  8080

RUN apt-get update && apt-get install --no-install-recommends -y curl dirmngr gnupg apt-transport-https ca-certificates
RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -\
 && echo 'deb https://deb.nodesource.com/node_8.x stretch main' > /etc/apt/sources.list.d/nodesource.list\
 && apt-get update\
 && apt-get install -y nodejs && apt-get clean && rm -rf /var/lib/apt/lists/*

# App
ADD . /web
WORKDIR /web
# Install app dependencies
RUN rm -rf node_modules && npm install

ENTRYPOINT ["npm", "start"]
