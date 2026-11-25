#!/bin/bash
set -euo pipefail

IMAGE_NAME="${1:-}"

if [ -z "$IMAGE_NAME" ]; then
  echo "Uso: ./scripts/deploy.sh <usuario/imagem:tag>"
  exit 1
fi

echo "1. Baixando imagem imutável: $IMAGE_NAME"
docker pull "$IMAGE_NAME"

echo "2. Atualizando stack via Docker Compose..."
export APP_IMAGE="$IMAGE_NAME"
docker compose up -d --remove-orphans

echo "3. Validando saúde da aplicação (/health)..."
sleep 5
STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/health)

if [ "$STATUS" -eq 200 ]; then
  echo "Deploy concluído com sucesso! HTTP $STATUS"
  docker image prune -f
else
  echo "Falha no healthcheck (HTTP $STATUS). Encerrando com erro..."
  docker compose down
  exit 1
fi