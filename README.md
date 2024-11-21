#step 1:
- update the 

```
sh run.sh

docker ps

docker exec -it <container_name> bash

sh script/validate-proxy.sh

sh script/setup-pingpong.sh ***
# *** == key

// remove container
docker stop <container_id>
docker rm <container_id>
docker rm -f $(docker ps -aq)

docker images
docker rmi <image_id>
docker rmi $(docker images -q) -f

docker image prune -f
docker system prune -f

```
