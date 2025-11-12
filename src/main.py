"""
Arquivo principal da aplicação.

Este é o ponto de entrada da aplicação. Adicione sua lógica aqui.
"""
import os
from dotenv import load_dotenv

# Carrega variáveis de ambiente do arquivo .env
load_dotenv()


def main():
    """
    Função principal da aplicação.
    """
    print("🚀 Aplicação Python iniciada!")
    print(f"Ambiente: {os.getenv('ENVIRONMENT', 'development')}")
    
    # Adicione sua lógica aqui
    pass


if __name__ == "__main__":
    main()
