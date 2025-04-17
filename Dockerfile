# Gunakan image PHP dengan Apache
FROM php:8.1-apache

# Install ekstensi PHP yang dibutuhkan Perfex
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    git \
    curl \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Aktifkan rewrite module untuk Apache
RUN a2enmod rewrite

# Copy source code ke /var/www/html
COPY ./crm /var/www/html/

# Set permission
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Ubah DocumentRoot ke /var/www/html (default Apache)
WORKDIR /var/www/html
