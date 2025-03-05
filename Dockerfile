# Use an official PHP runtime as a base image
FROM php:7.4-apache

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the current directory contents into the container at /var/www/html
# COPY . /var/www/html


# Copy your PHP application code into the container
COPY . .


# Install PHP extensions and other dependencies
RUN apt-get update && \
    apt-get install -y libpng-dev && \
    docker-php-ext-install pdo pdo_mysql gd

# Install any dependencies your PHP application might need
# For example, if you're using Composer, uncomment the following lines:
# RUN apt-get update && apt-get install -y \
#     unzip \
#     && rm -rf /var/lib/apt/lists/*
# COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
# RUN composer install --no-interaction --no-plugins --no-scripts

# CMD specifies the command to run on container startup
CMD ["apache2-foreground"]
