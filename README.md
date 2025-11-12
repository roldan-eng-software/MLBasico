# MLBasico

Descrição breve do projeto.

## 📋 Índice

- [Sobre](#sobre)
- [Requisitos](#requisitos)
- [Instalação](#instalação)
- [Uso](#uso)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Docker](#docker)
- [Testes](#testes)
- [Contribuindo](#contribuindo)

## 🎯 Sobre

Adicione uma descrição detalhada do seu projeto aqui.

## 📦 Requisitos

- Python 3.11+
- Docker (opcional)
- Docker Compose (opcional)

## 🚀 Instalação

### Instalação Local

```bash
# Clone o repositório
git clone <url-do-repositorio>
cd MLBasico

# Crie e ative o ambiente virtual
python3 -m venv .venv
source .venv/bin/activate  # Linux/Mac
# OU
.venv\Scripts\activate  # Windows

# Instale as dependências
pip install -r requirements-dev.txt

# Configure as variáveis de ambiente
cp .env.example .env
# Edite o arquivo .env com suas configurações

# Instale os pre-commit hooks
pre-commit install
```

### Usando o Script de Setup

```bash
# Execute o script de setup
./scripts/setup.sh
```

## 💻 Uso

### Executar Localmente

```bash
# Ativar ambiente virtual
source .venv/bin/activate

# Executar aplicação
python src/main.py

# OU usar o script
./scripts/run.sh
```

### Executar com Docker

```bash
# Build da imagem
docker build -t MLBasico:latest .

# Executar container
docker run -p 8000:8000 --env-file .env MLBasico:latest

# OU usar docker-compose
docker-compose up -d
```

## 📁 Estrutura do Projeto

```
MLBasico/
├── .github/              # GitHub Actions workflows
├── docs/                 # Documentação
├── scripts/              # Scripts auxiliares
│   ├── setup.sh         # Setup do ambiente
│   ├── run.sh           # Executar aplicação
│   ├── test.sh          # Executar testes
│   └── docker-build.sh  # Build Docker
├── src/                  # Código fonte
│   ├── __init__.py
│   └── main.py
├── tests/                # Testes
│   ├── __init__.py
│   └── test_main.py
├── .dockerignore
├── .gitignore
├── .pre-commit-config.yaml
├── Dockerfile
├── docker-compose.yml
├── requirements.txt      # Dependências de produção
├── requirements-dev.txt  # Dependências de desenvolvimento
└── README.md
```

## 🐳 Docker

### Build

```bash
# Build manual
docker build -t MLBasico:latest .

# Build com script
./scripts/docker-build.sh [tag]
```

### Run

```bash
# Executar container
docker run -p 8000:8000 --env-file .env MLBasico:latest

# Executar com docker-compose
docker-compose up -d

# Ver logs
docker-compose logs -f

# Parar containers
docker-compose down
```

## 🧪 Testes

```bash
# Executar todos os testes
pytest

# Executar com coverage
pytest --cov=src

# Executar com relatório HTML
pytest --cov=src --cov-report=html

# OU usar o script
./scripts/test.sh
```

## 🤝 Contribuindo

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -m 'Adiciona nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request

### Pre-commit Hooks

Este projeto usa pre-commit hooks para garantir qualidade do código:

```bash
# Instalar hooks
pre-commit install

# Executar manualmente
pre-commit run --all-files
```

## 📝 Licença

Adicione informações sobre a licença aqui.

## 👤 Autor

Seu Nome - [@seu_usuario](https://github.com/seu_usuario)

---

**Nota**: Este projeto foi criado usando um boilerplate Python profissional.
