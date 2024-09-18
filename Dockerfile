FROM node:18.20.4-alpine

ENV http_proxy=http://10.10.254.219:3128
ENV https_proxy=http://10.10.254.219:3128
ENV no_proxy=localhost,127.0.0.1,santafe.gov.ar,santafe.gob.ar,10.5.1.9,10.1.5.212

ENV HTTP_PROXY=http://10.10.254.219:3128
ENV HTTPS_PROXY=http://10.10.254.219:3128
ENV NO_PROXY=localhost,127.0.0.1,santafe.gov.ar,santafe.gob.ar,10.5.1.9,10.1.5.212


WORKDIR /app

ADD package.json package-lock.json /app/

RUN npm config set proxy http://10.10.254.219:3128

npm config set https-proxy http://10.10.254.219:3128

RUN npm install

EXPOSE 3000

ADD . /app

CMD ["node", "index"]
