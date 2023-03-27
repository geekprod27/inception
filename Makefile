PATHTOYML = srcs/docker-compose.yml

all: dirs build start

dirs:
	mkdir -p /home/nfelsemb/data/wordpress
	mkdir -p /home/nfelsemb/data/mariadb

build:
	docker compose -f $(PATHTOYML) build

start:
	docker compose -f $(PATHTOYML) up -d

stop:
	docker compose -f $(PATHTOYML) down

clean: stop
	docker system prune -fa --volumes

clean-data: stop
	sudo rm -rf /home/nfelsemb/data/mariadb/* /home/nfelsemb/data/wordpress/*

re: clean-data clean
	make all

.PHONY: all dirs build start stop clean clean-data re