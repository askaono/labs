FROM php:8.1-apache

# Install basic tools
RUN apt-get update && apt-get install -y \
    apt-utils \
    unzip \
    zip \
    git \
    curl \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    libonig-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    libicu-dev \
    libssl-dev \
    libmariadb-dev-compat \
    libmariadb-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install mysqli pdo pdo_mysql curl mbstring zip iconv openssl intl

# Install IMAP secara terpisah (dengan dukungan Kerberos & SSL)
RUN apt-get update && apt-get install -y libc-client-dev libkrb5-dev \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install imap

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Copy project files
COPY . /var/www/html/

# Set permission
RUN chown -R www-data:www-data /var/www/html/ && chmod -R 755 /var/www/html/

# Set working directory
WORKDIR /var/www/html/
