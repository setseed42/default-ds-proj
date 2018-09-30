#!/bin/bash
docker-compose up -d --build
docker exec -it "$(docker ps -aqf 'name=notebook')" /bin/sh -c "jupyter notebook list"
docker-compose logs -f app
