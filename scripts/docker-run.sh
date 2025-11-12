#!/bin/bash
# ============================================================================
# docker-run.sh - Executa Container Docker
# 
# Descrição:
#   Inicia a aplicação em um container Docker.
#
# Uso:
#   ./scripts/docker-run.sh
# ============================================================================

IMAGE_NAME=${PROJECT_NAME:-python-app}

echo "🐳 Iniciando container..."

# Para container existente se houver
docker stop ${IMAGE_NAME} 2>/dev/null
docker rm ${IMAGE_NAME} 2>/dev/null

# Inicia novo container
docker run -d \
  --name ${IMAGE_NAME} \
  -p 8000:8000 \
  --env-file .env \
  ${IMAGE_NAME}:latest

echo "✅ Container iniciado! Acesse: http://localhost:8000"
echo "📋 Logs: docker logs -f ${IMAGE_NAME}"
