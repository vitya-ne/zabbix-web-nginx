
DOCKER_IMAGE=megbeguk/zabbix-web-nginx
DOCKER_CONTAINER=zabbix-web
HOST_PORT_HTTP=8020
HOST_PORT_HTTPS=4020

# set param from cmd:
# make build DB_HOST="X.X.X.X" DB_PORT="YYYY" PG_PASS="ZZZZZZZZ"
#

ZBX_WEB_DIR=/srv/Zabbix/web


list:
	docker ps -a
	docker images -a

build:
	docker build -t $(DOCKER_IMAGE) src/
	docker images -a | grep $(DOCKER_IMAGE)

bash:
	docker run --rm --name $(DOCKER_CONTAINER)_bash -it $(DOCKER_IMAGE) bash

shell:
	docker exec -i -t $(DOCKER_CONTAINER) bash

run:
	docker run -d -t -e DB_SERVER_HOST=$(DB_HOST) -e DB_SERVER_PORT=$(DB_PORT) -e POSTGRES_USER="zabbix" -e POSTGRES_PASSWORD=$(PG_PASS) -e POSTGRES_DB="zabbix" --link zabbix-server:zabbix-server -p 0.0.0.0:$(HOST_PORT_HTTPS):443 -p 0.0.0.0:$(HOST_PORT_HTTP):80 -v $(ZBX_WEB_DIR)/nginx:/etc/ssl/nginx:ro --name $(DOCKER_CONTAINER) $(DOCKER_IMAGE)

log:
	docker logs $(DOCKER_CONTAINER)

rm:
	docker stop $(DOCKER_CONTAINER)
	docker rm $(DOCKER_CONTAINER)

rmi:
	docker rmi $(DOCKER_IMAGE)
	@echo dangling volumes:
	docker volume ls -qf dangling=true
#	docker volume rm $(docker volume ls -qf dangling=true)
	@echo dangling images:
	docker images -f "dangling=true" -q
#	docker rmi $(docker images -f "dangling=true" -q)
	@echo
	@echo All containers and images:
	docker ps -a
	docker images -a
