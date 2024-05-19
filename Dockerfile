FROM laravelsail/php83-composer:latest 

RUN docker-php-ext-install pdo pdo_mysql


WORKDIR /myapp
COPY . /myapp
RUN composer install

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - 
RUN apt-get install -y nodejs

RUN npm install -g vite
RUN npm install


CMD php artisan config:clear  && php artisan migrate --force && php artisan serve --host=0.0.0.0 --port=9000

EXPOSE 9000