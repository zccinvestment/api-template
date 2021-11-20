from typing import Dict

import pytest


def build_health_check_response(**kwargs) -> Dict[str, str]:
    response = dict(message="api-template status is OK")

    response.update(kwargs)
    return response


@pytest.fixture
def health_check_response():
    return build_health_check_response()
