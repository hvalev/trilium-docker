FROM node:16.10.0-alpine
ENV TRILIUM_VERSION v0.47.5

# Create app directory
WORKDIR /usr/src/app
RUN apk update && \
    apk add --no-cache --virtual git && \
    git clone --depth 1 --branch=${TRILIUM_VERSION} https://github.com/zadam/trilium/ . 

COPY server-package.json package.json

# Install app dependencies
RUN set -x \
    && apk add --no-cache --virtual .build-dependencies \
        autoconf \
        automake \
        g++ \
        gcc \
        libtool \
        make \
        nasm \
        libpng-dev \
        python \
    && npm install --production \
    && apk del .build-dependencies

# Bundle app source
COPY . .

USER node

EXPOSE 8080
CMD [ "node", "./src/www" ]