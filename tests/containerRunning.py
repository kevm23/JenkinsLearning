import requests


def test_get_successful_response():
    resp = requests.get("http://localhost:8888")
    assert resp.status_code == 200