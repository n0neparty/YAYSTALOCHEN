   # Используем базовый образ PHP с Apache
   FROM php:8.0-apache

   # Скопируем все файлы в папку /var/www/html/
   COPY . /var/www/html/

   # Установим необходимые расширения PHP
   RUN docker-php-ext-install mysqli pdo pdo_mysql

   # Задаем рабочую директорию
   WORKDIR /var/www/html/

   # Установим зависимости
   COPY composer.json composer.lock ./
   RUN apt-get update && apt-get install -y \
       libzip-dev \
       zip \
       unzip && \
       docker-php-ext-install zip && \
       curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
       composer install

   # Устанавливаем права на папку, чтобы не было проблем с правами доступа
   RUN chown -R www-data:www-data /var/www/html/
