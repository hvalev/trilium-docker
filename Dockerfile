FROM node:16.12.0-alpine
ENV TRILIUM_VERSION v0.48.3

# Create app directory
WORKDIR /usr/src/app

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
        git \
    && git clone --depth 1 --branch=${TRILIUM_VERSION} https://github.com/zadam/trilium/ . \
    && npm install --production \
    && apk del .build-dependencies

# Bundle app source
COPY . .

USER node

EXPOSE 8080
CMD [ "node", "./src/www" ]