# h5ai-docker

h5ai webserver index as a Docker container.

The following usage examples deploy the docker container with port 1080 only accessibe from localhost (127.0.0.1). This is to be secure by default.

## Docker Usage

Adjust volume mount point and port to your needs.

```
docker build -t h5ai .
docker run \
  -v /tmp/data:/var/www/html/data \
  -p 127.0.0.1:1080:80 --name h5ai h5ai
```

## Docker Compose Usage

Adjust `docker-compose.yml` to your needs or use the following default values.

Data mountpoint: `./data`  
URL: `http://127.0.0.1:1080/`

```
docker-compose up --build
```
