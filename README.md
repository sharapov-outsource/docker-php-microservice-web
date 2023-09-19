# Docker PHP Web Microservice

## Build the container
```bash
docker build . -t docker-php-microservice-web:latest --no-cache
```

# Run the container
```bash
docker run -it --env-file=.env --name docker-php-microservice-web -p 8080:80 -d docker-php-microservice-web:latest
```

## Show logs
```bash
docker logs -f docker-php-microservice-web
```

## Container CLI
```bash
docker exec -it docker-php-microservice-web /bin/sh
```
