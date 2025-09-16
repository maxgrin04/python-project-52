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
	gunicorn task_manager.wsgi:application --bind 0.0.0.0:${PORT:-8000}

migrate:
	uv run python manage.py makemigrations && \
	uv run python manage.py migrate

test:
	uv run python manage.py test

test-coverage:
	DJANGO_SETTINGS_MODULE=task_manager.settings uv run pytest --cov=task_manager --cov-report=xml

make dev:
	uv run python manage.py runserver
