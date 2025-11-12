"""
Testes para o módulo main.

Execute com: pytest
"""
import pytest
from src.main import main


def test_main_executa_sem_erro():
    """
    Testa se a função main executa sem erros.
    """
    try:
        main()
        assert True
    except Exception as e:
        pytest.fail(f"main() gerou uma exceção: {e}")
