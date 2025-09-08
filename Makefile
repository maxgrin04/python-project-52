.PHONY: install migrate  build render-start lint lint-fix

build:
	./build.sh

install:
	uv sync

lint:
	uv run ruff check .

lint-fix:
	uv run ruff check --fix .

render-start:
	gunicorn task_manager.wsgi

migrate:
	uv	run manage.py migrate
