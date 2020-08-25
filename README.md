# Order Service

API responsable to handle order management.

## Environment dependencies

* Ruby 2.7
* PostgreSQL
* RabbitMQ

## Postman collection

* https://www.getpostman.com/collections/dc352d58dbb60754e2a1


## Endpoints

Order Service is a microservice with a public API that deals with orders. 

For now, it implements only two endpoints:

## Create order

`POST v1/orders`

This endpoint expects the following payload:

## user_info (required)

A Hash with information about the user, with the user name, email, and phone. All of them are required.

Example:

json
"user_info": {
  "name": "John Doe",
  "email": "john.doe@gmail.com",
  "phone": "(11) 987654567"
}


## address_attributes (required)

A Hash with information about the address of the order, with the city, neighborhood, street, uf, and zip_code. All of them are required.

Example:

json
"address_attributes: {
  "city": "São Paulo",
  "neighborhood": "Itaim",
  "street": "Rua das nações",
  "uf": "SP",
  "zip_code": "14037-5"
}


##  request_info (optional)

A Hash with extra information about the order.

Example:

json
"request_info": {
  "question1": "answer1",
  "question2": "answer2",
  "question3": "answer3"
}

### Setup
You can use docker to run this app. 

```bash
  docker-compose up -d
  docker-compose exec rails rake db:create
  docker-compose exec rails rake db:migrate
  docker-compose exec rails rake db:test:prepare
  docker-compose exec rails rspec
```

### Logs

```bash
  docker-compose logs -f
```

### Start

```bash
  docker-compose up
```

### Stop

```bash
  docker-compose stop
```

### Tests

```bash
  docker-compose exec rails rspec
```

## Alerts
To execute this project with Geolocation-Service's project you must clone both repositories on the same folder and extract the docker-compose.yml to root folder.

```bash
  docker-compose up --build
```
