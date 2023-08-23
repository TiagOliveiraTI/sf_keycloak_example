FROM base:1

RUN apk --update --no-cache add git $PHPIZE_DEPS icu-dev

WORKDIR /var/www/app

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions intl pdo_mysql xdebug

RUN apk update
RUN apk upgrade
RUN apk add bash
RUN apk add tzdata

ENV TZ="America/Sao_Paulo"

# Installing Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
EXPOSE 9003
