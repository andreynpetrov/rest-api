from fastapi.testclient import TestClient

from .main import app

client = TestClient(app)


def test_homepage():
    response = client.get("/")
    assert response.status_code == 200
    assert response.content == b'{"hello":"world"}'


def test_user():
    response = client.get("/users/TestUser/")
    assert response.status_code == 200
    assert response.content == b'{"username":"TestUser"}'


def test_time():
    response = client.get("/time/")
    assert response.status_code == 200


def test_address():
    response = client.get("/address/")
    assert response.status_code == 200
