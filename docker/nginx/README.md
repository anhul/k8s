## Build image with specified application verison
docker build -t app:1.0 --build-arg APP_VERSION=1.0 .
docker build -t app:2.0 --build-arg APP_VERSION=2.0 .

## Run application in nginx container
docker run --name app-1.0 -p 8081:80 app:1.0
docker run --name app-2.0 -p 8082:80 app:2.0