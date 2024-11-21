```
chmod -R 777 data

docker-compose up -d --build

docker exec -it app_container bash
ls /data

docker exec -it <container_name> bash

#检查挂载状态
docker inspect app_container | grep Mounts -A 10
```