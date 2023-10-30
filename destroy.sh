docker compose down
docker container rm $(docker ps -a | awk '{print $NF}' | grep opendata)
