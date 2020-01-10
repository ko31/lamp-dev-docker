FROM php:7.3-apache

RUN apt-get -y update

## Tools
#RUN apt-get -y install apt-utils nano wget dialog
#
## Libraries
#RUN apt-get -y install --fix-missing apt-utils build-essential git curl libcurl3 libcurl3-dev zip
#
## Composer
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
#
## xdebug
#RUN pecl install xdebug
#RUN docker-php-ext-enable xdebug

## ssmtp
#RUN apt-get install -y ssmtp mailutils
# MailCatcher
RUN apt-get install -y ruby ruby-dev rubygems libsqlite3-dev
RUN gem install mailcatcher

# PHP Extensions

RUN docker-php-ext-install pdo_mysql 
RUN docker-php-ext-install mysqli

RUN docker-php-ext-install mbstring

RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd

# Enable apache modules
RUN a2enmod rewrite
