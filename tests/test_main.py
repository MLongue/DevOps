
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)


def test_healthcheck():
    response = client.get("/health")
    assert response.status_code == 200
    assert response.json()["status"] == "healthy"


def test_create_and_list_task():
    payload = {"title": "Configurar pipeline CI", "done": False}
    response = client.post("/tasks", json=payload)
    assert response.status_code == 201
    data = response.json()
    assert data["title"] == "Configurar pipeline CI"
    assert data["id"] == 1

    list_resp = client.get("/tasks")
    assert list_resp.status_code == 200
    assert len(list_resp.json()["tasks"]) >= 1


def test_create_task_validation_error():
    response = client.post("/tasks", json={"done": True})
    assert response.status_code == 422
