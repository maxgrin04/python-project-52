.PHONY: install migrate collectstatic build render-start dev lint lint-fix

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
	python manage.py migrate
