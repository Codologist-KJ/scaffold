# Variables
VENV = venv
PYTHON = $(VENV)/bin/python
PIP = $(VENV)/bin/pip
PYTEST = $(VENV)/bin/pytest

# Default target
all: install test

# Set up the virtual environment
venv:
	python -m venv $(VENV)

# Install dependencies
install: venv
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

# Run tests
test:
	$(PYTEST) tests/

# Clean up temporary files and virtual environment
clean:
	rm -rf __pycache__ .pytest_cache
	rm -rf $(VENV)
	find . -type f -name '*.pyc' -delete
	find . -type d -name '__pycache__' -delete

# Format code using black
format:
	$(VENV)/bin/black src/ tests/

# Lint code using flake8
lint:
	$(VENV)/bin/flake8 src/ tests/

# Run the application
run:
	$(PYTHON) src/main.py

# Help command to list available targets
help:
	@echo "Available targets:"
	@echo "  all       : Install dependencies and run tests (default)"
	@echo "  venv      : Set up the virtual environment"
	@echo "  install   : Install dependencies"
	@echo "  test      : Run tests"
	@echo "  clean     : Clean up temporary files and virtual environment"
	@echo "  format    : Format code using black"
	@echo "  lint      : Lint code using flake8"
	@echo "  run       : Run the application"
	@echo "  help      : Show this help message"