#!/bin/bash

# Nome da imagem e contêiner
IMAGE_NAME="api-image"
CONTAINER_NAME="api-container"

# Parar e remover o contêiner existente, se existir
docker stop "$CONTAINER_NAME" >/dev/null 2>&1
docker rm "$CONTAINER_NAME" >/dev/null 2>&1

# Construir a nova imagem
docker build -t "$IMAGE_NAME" .

# Executar o novo contêiner
docker run -d --name "$CONTAINER_NAME" -p 3302:80 "$IMAGE_NAME"

# Access this in browser: http://127.0.0.1:3302/items/5?q=somequery
