# Order Service

API responsable to handle with order management.

## Environment dependencies

* Ruby 2.7
* PostgreSQL
* RabbitMQ

## Endpoints

#### Order

`POST v1/orders`

Request attributes:

`user_info` (required)

A Hash of user_info, with the user `name`, `email`, `phone` all data MUST include.

`address_attributes` (required)

A Hash of address_attributes, with the address `city`, `heighboorhood`, `street`, `uf`, `zip_code` all data MUST include.

`request_info` (optional)

A Hash of request_info.


`PUT v1/orders/:id`

Request attributes:

`address_attributes`

A Hash of address_attributes, with coordinates `latitude` and `longitude`.

### Setup
You can use docker to run this app. 

```bash
  docker-compose up -d
  docker-compose exec order rake db:create
  docker-compose exec order rake db:migrate
  docker-compose exec order rake db:test:prepare
  docker-compose exec order rspec
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
  docker-compose exec order rspec
```

## Alerts
To execute this project with Geolocation-Service's project you must clone both repos on the same folder and extract the docker-compose.yml to root folder.

```bash
  docker-compose up --build
```
