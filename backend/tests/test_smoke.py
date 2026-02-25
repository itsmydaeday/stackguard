import pytest
from fastapi.testclient import TestClient

from app.main import app


@pytest.fixture()
def client():
    # Using context manager ensures FastAPI startup events run (DB init + seeding)
    with TestClient(app) as c:
        yield c


def test_health_smoke(client: TestClient) -> None:
    response = client.get('/health')
    assert response.status_code == 200
    body = response.json()
    assert body['status'] == 'ok'


def test_me_requires_auth(client: TestClient) -> None:
    response = client.get('/api/v1/me')
    assert response.status_code == 401


def test_login_and_me(client: TestClient) -> None:
    login = client.post('/api/v1/token', data={'username': 'admin', 'password': 'admin123!'})
    assert login.status_code == 200
    token = login.json()['access_token']

    me = client.get('/api/v1/me', headers={'Authorization': f'Bearer {token}'})
    assert me.status_code == 200
    assert me.json()['username'] == 'admin'
    assert me.json()['role'] == 'admin'
