
DOCKER_IMAGE=megbeguk/zabbix-web-nginx
DOCKER_CONTAINER=zabbix-web
VOL_DANG=$(docker volume ls -qf dangling=true)
IMG_DANG=$(docker images -f "dangling=true" -q)


list:
	docker ps -a
	docker images -a

build:
	docker build -t $(DOCKER_IMAGE) src/
	docker images -a | grep $(DOCKER_IMAGE)


log:
	docker logs $(DOCKER_CONTAINER)

rm:
	docker stop $(DOCKER_CONTAINER)
	docker rm $(DOCKER_CONTAINER)

rmi:
	docker rmi $(DOCKER_IMAGE)
ifeq ("$(VOL_DANG)", "")
	@echo "dangling volumes: none"
else
	@echo "remove dangling volumes:"
	docker volume rm $(VOL_DANG)
endif
ifeq ("$(IMG_DANG)","")
	@echo "dangling images: none"
else
	@echo "remove dangling images:"
	docker rmi $(IMG_DANG)
endif
