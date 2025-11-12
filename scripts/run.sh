#!/bin/bash
# ============================================================================
# run.sh - Executa a Aplicação
# 
# Descrição:
#   Script conveniente para iniciar a aplicação.
#
# Uso:
#   ./scripts/run.sh
# ============================================================================

echo "🚀 Iniciando aplicação..."

# Ativa ambiente virtual
source .venv/bin/activate

# Executa a aplicação
python src/main.py
