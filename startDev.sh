#!/bin/bash
docker-compose up -d --build
docker-compose exec notebook jupyter notebook list
docker-compose logs -f app
