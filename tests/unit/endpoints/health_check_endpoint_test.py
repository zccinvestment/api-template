import json
from typing import Dict

from fixtures.app import client
from fixtures.endpoints.health_check_endpoint import health_check_response


def test_health_check_endpoint(
    client,
    health_check_response: Dict[str, str],
):
    response = client.get('/healthcheck')

    assert response.status_code == 200
    assert json.loads(response.data) == health_check_response
