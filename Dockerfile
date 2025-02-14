# Étape 1 : Image de base PHP avec FPM
FROM php:8.3-fpm

# Étape 2 : Définir le répertoire de travail
WORKDIR /var/www/html

# Étape 3 : Installer les dépendances système et les extensions PHP
RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    git \
    mariadb-client \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    curl \
    && docker-php-ext-install pdo_mysql mbstring zip exif pcntl bcmath gd opcache \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Étape 4 : Installer Composer
COPY --from=composer:2.7 /usr/bin/composer /usr/bin/composer

# Étape 5 : Copier les fichiers de l'application
COPY . .

# Étape 6 : Définir les permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 775 /var/www/html/storage \
    && chmod -R 775 /var/www/html/bootstrap/cache

# Étape 7 : Configurer OPcache
COPY opcache.ini /usr/local/etc/php/conf.d/opcache.ini

# Étape 8 : Exposer le port 9000 pour PHP-FPM
EXPOSE 9000

# Étape 9 : Démarrage de PHP-FPM
CMD ["php-fpm"]