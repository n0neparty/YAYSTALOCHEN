    # Используем базовый образ PHP с Apache
    FROM php:8.0-apache

    # Копируем все файлы в папку /var/www/html/
    COPY . /var/www/html/

    # Установим необходимые расширения PHP
    RUN docker-php-ext-install mysqli pdo pdo_mysql

    # Устанавливаем права на папку, чтобы не было проблем с правами доступа
    RUN chown -R www-data:www-data /var/www/html/
    
