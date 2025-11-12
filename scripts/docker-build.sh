#!/bin/bash
# ============================================================================
# docker-build.sh - Build da Imagem Docker
# 
# Descrição:
#   Constrói a imagem Docker da aplicação.
#
# Uso:
#   ./scripts/docker-build.sh [tag]
# ============================================================================

# Define tag padrão se não fornecida
TAG=${1:-latest}
IMAGE_NAME=${PROJECT_NAME:-python-app}

echo "🐳 Construindo imagem Docker: ${IMAGE_NAME}:${TAG}"

# Build da imagem
docker build -t ${IMAGE_NAME}:${TAG} .

echo "✅ Imagem construída: ${IMAGE_NAME}:${TAG}"
