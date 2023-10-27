# magento.docker
Magento  Docker

#DOCKER ALWAYS CREATE

docker-compose build --no-cache

#DOCKER UP

docker-compose up -d

#Execute docker container
#CONTAINER magento_docker-php8


docker exec -it -u root _docker-php8 bash 


#URLS

MaildHog =   http://localhost:8026/
PHPMYADMIN = http://localhost:8082/
RABBITMQ =    http://localhost:15673/
OPEN SEARCH = http://localhost:9400/
MAGENTO URL = http://magento.docker/  - change url in .env
PORTAINER = http://localhost:9001/
#Delete docker container and images all
#Docker Container
docker rm -vf $(docker ps -aq)

#Docker Images

docker rmi -f $(docker images -aq)


#Deploy Command

docker exec -it -u root ea048cfbfc1e  /var/www/deploy.sh full

docker exec -it -u root ea048cfbfc1e  /var/www/deploy.sh index

docker exec -it -u root ea048cfbfc1e  /var/www/deploy.sh upgrade_content

docker exec -it -u root ea048cfbfc1e  /var/www/deploy.sh permission

