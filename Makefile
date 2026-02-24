SHELL := /bin/bash
.SHELLFLAGS := -euo pipefail -c
.ONESHELL:

.PHONY: bootstrap dev verify clean

bootstrap:
	# Python deps in a local venv (Ubuntu uses PEP 668: system pip installs are blocked)
	python3 -m venv .venv
	source .venv/bin/activate
	python -m pip install -U pip
	pip install -r backend/requirements.txt
	pip install -r worker/requirements.txt
	cd frontend && npm install

dev:
	docker compose up --build

verify:
	source .venv/bin/activate
	(cd backend && python -m pytest -q tests/test_smoke.py)
	(cd frontend && npm run build)
	docker compose config > /tmp/stackguard-compose.rendered.yml

clean:
	rm -rf .venv
