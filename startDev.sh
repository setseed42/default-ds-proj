#!/bin/bash
docker-compose up -d --build
docker-compose logs notebook
docker-compose logs -f app
