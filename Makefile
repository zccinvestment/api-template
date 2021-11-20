.PHONY: init \
init-venv \
update-venv \
clean \
clean-venv \
clean-pyc \
clean-test \
test

.DEFAULT_GOAL := help

############################################################################
## General Parameters Configuration
## This section will define the parameters that will be used in
## all environments, regardless of CI and DEV
############################################################################

# Python requirements
VENV ?= venv
REQUIREMENTS ?= requirements-dev.txt


############################################################################
## Target definitions
## This section will define the projects make targets
############################################################################

help:
	@echo "    init"
	@echo "        Initializes development environment."
	@echo "    init-venv"
	@echo "        Initializes python environment."
	@echo "    clean"
	@echo "        Removes all the development environment files."
	@echo "    clean-venv"
	@echo "        Removes Python virtual environment."
	@echo "    clean-pyc"
	@echo "        Removes Python artifacts."
	@echo "    clean-test"
	@echo "        Removes Test data."
	@echo "    test"
	@echo "        Runs unit tests."

# -----------------------------
# Environment Setup
# Python/Node Init & Clean
# -----------------------------

init: clean init-venv

init-venv: clean-venv create-venv update-venv
	@echo ""
	@echo "Do not forget to activate your new virtual environment"

create-venv:
	@echo "Creating virtual environment: $(VENV)..."
	@python3 -m venv $(VENV)

update-venv:
	@echo "Updating virtual environment: $(VENV)..."
	@( \
		. $(VENV)/bin/activate; \
		pip install --upgrade pip; \
		pip install -r $(REQUIREMENTS) \
	)

clean: clean-venv clean-pyc clean-test

clean-venv:
	@echo "Removing virtual environment: $(VENV)..."
	@rm -rf $(VENV)

clean-pyc:
	@echo "Removing compiled bytecode files..."
	@find . -name '*.pyc' -exec rm -f {} +
	@find . -name '*.pyo' -exec rm -f {} +
	@find . -name '*~' -exec rm -f {} +
	@find . -name '__pycache__' -exec rm -fr {} +

# -----------------------------
# Testing
# Executing and orchestrating the test suites
# -----------------------------

test: clean-test unit-pytest clean-test

unit-pytest:
	@echo "Running test..."
	@( \
		. $(VENV)/bin/activate; \
		pytest tests/unit; \
	)

clean-test: clean-pyc
	@echo "Removing previous test data..."
	@rm -rf .coverage
	@rm -rf htmlcov
	@rm -rf test-reports
	@rm -f coverage.xml
	@rm -rf .pytest_cache
