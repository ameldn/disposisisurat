# Laravel
> - Laravel 10  
> - php 8.1  
> - MySQL  
> - Nodejs 20 LTS
1. cloning
```bash
cp .env.example .env
```

2. setup environtment variable in ```.env```

3. serving
```bash
composer install
php artisan key:generate
npm i
npm run build
php artisan migrate
php artisan db:seed
php artisan serve --host 0.0.0.0
```
