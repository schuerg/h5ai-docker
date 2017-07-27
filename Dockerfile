FROM php:7.1-apache
LABEL maintainer="Simon Schürg"

ENV h5ai_FILENAME 'h5ai-0.29.0.zip'
ENV h5ai_URL 'https://release.larsjung.de/h5ai/'$h5ai_FILENAME

ADD $h5ai_URL .

RUN apt-get update && apt-get install -y \
    unzip \
    zip \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng12-dev \
    imagemagick \
    libav-tools \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd exif \
    && unzip ${h5ai_FILENAME} \
    && rm ${h5ai_FILENAME} \
    && chown www-data:www-data _h5ai/private/cache \
    && chown www-data:www-data _h5ai/public/cache \
    && rm -rf /var/lib/apt/lists/*

COPY .htaccess .
COPY options.json _h5ai/private/conf/options.json
