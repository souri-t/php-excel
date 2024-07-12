FROM php:8.3-fpm

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install PHP extensions
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli zip

RUN apt-get install vim -y

# Copy custom php.ini
COPY php.ini /usr/local/etc/php/

# Set working directory
WORKDIR /var/www/html

RUN composer require phpoffice/phpspreadsheet
