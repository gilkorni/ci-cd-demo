from fastapi.testclient import TestClient
from main import app

client = TestClient(app)


def test_is_alive():
    response = client.get("/is_alive")
    assert response.status_code == 200
    assert response.json() == {"status": "alive"}
