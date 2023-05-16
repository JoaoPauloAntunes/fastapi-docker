#!/bin/bash
# chmod +x deploy.sh

# Parar e remover o contêiner existente, se existir
docker stop "fastapi-container" >/dev/null 2>&1
docker rm "fastapi-container" >/dev/null 2>&1

# Construir a nova imagem
docker build -t "fastapi-image" .

# Executar o novo contêiner
docker run -d --name "fastapi-container" -p 3304:80 "fastapi-image"

# Access this in browser: http://127.0.0.1:3304/items/5?q=somequery
