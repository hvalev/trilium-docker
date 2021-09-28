# Trilium container for Docker
[![build](https://github.com/hvalev/trilium-docker/actions/workflows/build.yml/badge.svg)](https://github.com/hvalev/trilium-docker/actions/workflows/build.yml)
![R%20version](https://img.shields.io/badge/trilium%20version-0.47.5-green)
![Docker Pulls](https://img.shields.io/docker/pulls/hvalev/trilium)
![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/hvalev/trilium)

## Motivation
[Trilium](https://github.com/zadam/trilium) is an excellent note taking application with focus on building large personal knowledge bases. Unfortunately, Trilium is not officially available as a docker container for ARM architectures. Although docker images that offer ARM builds exist, they are rarely updated. Hence, the main point of this repository is to 1)  have a repository which is regularly updated and 2) transparent in what it contains (no crypto miners). If the original repository ever decides to support ARM, this repository will be archived. If you want more information on Trilium and what you can do with it, check out the [original repository](https://github.com/zadam/trilium).

## How to run it
Docker run:
```
docker run -d -p 8066:8080 -e TRILIUM_DATA_DIR=/data -v ~/trilium:/data --name trilium hvalev/trilium:latest
```
docker-compose:
```
version: "3.8"
services:
  trilium:
    image: hvalev/trilium:latest
    container_name: trilium
    environment:
      - TRILIUM_DATA_DIR=/data
    ports:
      - 8066:8080
    volumes:
      - ~/trilium:/data
    restart: always
```

## Acknowledgements
Naturally to [zadam](https://github.com/zadam) for creating [Trilium](https://github.com/zadam/trilium).
See [Licence](https://github.com/zadam/trilium/blob/master/LICENSE)

