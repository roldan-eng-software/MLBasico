# ============================================================================
# Dockerfile - Multi-stage Build para Aplicação Python
# 
# Descrição:
#   Este Dockerfile usa a técnica de multi-stage build para criar uma
#   imagem Docker otimizada e segura para aplicações Python.
#
# Estágios:
#   1. builder: Instala dependências e compila pacotes
#   2. runtime: Imagem final leve apenas com o necessário para executar
#
# Build:
#   docker build -t nome-da-imagem:tag .
#
# Run:
#   docker run -p 8000:8000 nome-da-imagem:tag
# ============================================================================

# --- ESTÁGIO 1: BUILDER ---
# Este estágio prepara todas as dependências
FROM python:3.11-slim as builder

# Define variável de ambiente para evitar criação de arquivos .pyc
# Isso reduz o tamanho da imagem
ENV PYTHONDONTWRITEBYTECODE=1

# Define buffer de saída como unbuffered
# Isso garante que os logs apareçam imediatamente
ENV PYTHONUNBUFFERED=1

# Define o diretório de trabalho
WORKDIR /app

# Copia arquivos de requisitos primeiro (aproveitamento de cache)
# O Docker faz cache das camadas, então se os requirements não mudarem,
# não precisa reinstalar as dependências
COPY requirements.txt .

# Instala as dependências em um diretório específico
# --no-cache-dir: não mantém cache do pip (reduz tamanho)
# --user: instala no diretório do usuário
RUN pip install --no-cache-dir --user -r requirements.txt

# --- ESTÁGIO 2: RUNTIME ---
# Imagem final, leve e segura
FROM python:3.11-slim

# Novamente define as variáveis de ambiente
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Cria um usuário não-root para executar a aplicação
# Isso é uma boa prática de segurança
# -r: usuário de sistema
# -s /bin/false: sem shell interativo
RUN useradd -r -s /bin/false appuser

# Define o diretório de trabalho
WORKDIR /app

# Copia as dependências instaladas do estágio builder
# Isso evita reinstalar tudo novamente
COPY --from=builder /root/.local /home/appuser/.local

# Adiciona o diretório de binários do usuário ao PATH
ENV PATH=/home/appuser/.local/bin:$PATH

# Copia o código fonte da aplicação
COPY --chown=appuser:appuser ./src ./src

# Muda para o usuário não-root
USER appuser

# Expõe a porta que a aplicação usa
# Nota: isso é apenas documentação, não abre a porta automaticamente
EXPOSE 8000

# Define o comando padrão para executar a aplicação
# Substitua pelo comando correto da sua aplicação
CMD ["python", "src/main.py"]

# Exemplo para FastAPI:
# CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000"]

# Exemplo para Flask:
# CMD ["flask", "run", "--host=0.0.0.0", "--port=8000"]

