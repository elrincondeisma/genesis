FROM icatala198724/octaneimage

WORKDIR /app
COPY . .

RUN composer install
RUN composer require laravel/octane spiral/roadrunner

COPY .env.example .env

RUN php artisan key:generate
RUN php artisan octane:install --server="swoole"

CMD php artisan octane:start --server="swoole" --host="0.0.0.0" 
EXPOSE 8000
