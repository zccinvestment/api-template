import pytest

from app.main import app


@pytest.fixture
def client():
    app.config.from_mapping({'TESTING': True})

    with app.test_client() as test_client:
        yield test_client
