# PHP + Apache
FROM php:7.4-apache

# Update OS and install common dev tools
RUN apt-get update
RUN apt-get install -y wget vim git zip unzip zlib1g-dev libzip-dev libpng-dev

# Install PHP extensions needed
RUN docker-php-ext-install -j$(nproc) mysqli pdo_mysql gd zip pcntl exif

# Enable common Apache modules
RUN a2enmod headers expires rewrite

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

# Set working directory to workspace
# from the command line execute the following to create the volume
# docker volume create data --opt type=none --opt device=/Users/omaraljazairy/Documents/Development/Dockers/MediaWiki/data --opt o=bind
# apt-get update
# apt-get install libicu-dev
# docker-php-ext-configure intl
# docker-php-ext-install intl
# pecl channel-update pecl.php.net
# pecl install apcu
# apt-get install imagemagick

WORKDIR /var/www