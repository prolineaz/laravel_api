# Laravel API

A simple example of a Laravel API with Auth JWT, Swagger, and CRUD
- DB: PostgreSQL
- Framework: Laravel 9
- Web Server: Nginx 
- PHP 8.1.12
- Swagger OpenAPI

## Simple Start

Start with Docker
```bash
docker-compose up -d
```

Composer install
```bash
docker-compose exec app composer install --ignore-platform-reqs --no-interaction
```
Provide write permissions
```bash
docker-compose exec app chmod -R 777 ./storage ./.phpunit.result.cache ./bootstrap
```

## Ports and web resources
API Service & Swagger
```bash
http://<IP>:8020
```
pgAdmin4
```bash
http://<IP>:8010

Email: demo@demo.demo
Password: 123456
```

## Running Tests
```bash
docker-compose exec app php artisan test
```

![php artisan test](https://raw.githubusercontent.com/prolineaz/laravel_api/master/test.png)

## API

#### Auth

**Method**: POST, **Action**: Login

`/api/auth/login`

**Method**: POST, **Action**: Register  

`/api/auth/register`

**Method**: POST, **Action**: Logout  

`/api/auth/logout`

**Method**: POST, **Action**: Refresh token  

`/api/auth/refresh`


#### Comments

**Method**:  GET,  **Action**: Return all comments

`/api/comment`

**Method**:  POST,  **Action**: Add new comment

`/api/comment/store`

**Method**:  GET,  **Action**: Show comment by id 

`/api/comment/{id}`

**Method**:  POST,  **Action**: Update comment by id 

`/api/comment/{id}/update`

**Method**:  POST,  **Action**: Delete comment by id  

`/api/comment/{id}/destroy`

#### Posts

**Method**:  GET,  **Action**: Return all posts belong to current user and all comments of each user 

`/api/posts`

**Method**:  POST,  **Action**: Add new post 

`/api/posts/store`

**Method**:  GET,  **Action**: Show post by id 

`/api/posts/{id}`

**Method**:  POST,  **Action**: Update post by id  

`/api/posts/{id}/update`

**Method**:  POST,  **Action**: Delete post by id  

`/api/posts/{id}/destroy`

#### Users

**Method**:  GET,  **Action**: Return all users with posts and all comments which the current user left under any post 

`/api/users`



![Swagger](https://raw.githubusercontent.com/prolineaz/laravel_api/master/swagger.png)
