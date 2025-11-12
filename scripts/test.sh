#!/bin/bash
# ============================================================================
# test.sh - Executa Testes
# 
# Descrição:
#   Executa todos os testes com coverage.
#
# Uso:
#   ./scripts/test.sh
# ============================================================================

echo "🧪 Executando testes..."

# Ativa ambiente virtual
source .venv/bin/activate

# Executa testes com coverage
pytest tests/ --cov=src --cov-report=html --cov-report=term

echo "📊 Relatório de cobertura gerado em htmlcov/index.html"
