#!/bin/bash
# ============================================================================
# setup.sh - Script de Setup Rápido
# 
# Descrição:
#   Configura rapidamente o ambiente de desenvolvimento.
#
# Uso:
#   ./scripts/setup.sh
# ============================================================================

echo "🔧 Configurando ambiente..."

# Ativa ambiente virtual
source .venv/bin/activate

# Instala dependências
echo "📦 Instalando dependências..."
pip install -r requirements-dev.txt

# Instala pre-commit hooks
echo "🪝 Instalando pre-commit hooks..."
pre-commit install

echo "✅ Setup completo!"
