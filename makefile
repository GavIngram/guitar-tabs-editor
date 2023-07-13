# apt install jq

#container_name = xxxx
#container_id = $(shell docker ps -aqf "name=$(container_name)")
#container_id = $(shell docker compose ps -q)
input ?= $(shell bash -c 'read -p "input: " pwd; echo $$pwd')
first_container_id = $(shell docker compose ps -q | head -n 1)
choose_container_name = $(shell bash -c 'select a in $$(docker compose ps -a --format json | jq -r .[].Name); do echo $$a && break; done')
choose_container_id = $(shell docker ps -aqf "name=$(choose_container_name)")


ls:
	cat makefile | grep --color=auto -E "^\S+:|^##.*"

## Docker Compose
up:
	docker compose up -d && docker compose logs -ft
down:
	docker compose down
stop:
	docker compose stop
pull:
	docker compose pull
logs:
	docker compose logs -ft
logs1:
	docker compose logs -ft --tail 10
ps:
	docker compose ls -a
	docker compose ps -a
names:
	docker compose ps -a --format json | jq .[].Name
ids:
	docker compose ps -a --format json | jq -r '.[] | [ .Name, .ID] | @tsv'

sh:
	docker exec -it $(choose_container_name) /bin/sh
bash:
	docker exec -it $(choose_container_name) /bin/bash
inspect:
	docker inspect $(choose_container_name) | jq


testinput:
	echo $(input)

## Direcotry Permissions

createdatadir:
	docker run --rm -it -v ./data:/irrelevantName alpine chmod -R 755 /irrelevantName
	docker run --rm -it -v ./data:/irrelevantName alpine chown -R 1000 /irrelevantName
	docker run --rm -it -v ./data:/irrelevantName alpine stat -c '%a' /irrelevantName
	stat -c '%a' dat