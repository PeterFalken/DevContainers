#!/usr/bin/env bash

PYTHON_VENV=".venv"

# If python environment doesn't exist
if [ ! -d ${PYTHON_VENV} ]; then
    python3 -m venv "${PYTHON_VENV}" --prompt 'dev.venv'
    source "${PYTHON_VENV}"/bin/activate
    pip install --no-cache-dir -U -r requirements-dev.txt
    if [ -f requirements.txt ]; then
        source "${PYTHON_VENV}"/bin/activate
        pip install --no-cache-dir -U pip
        pip install --no-cache-dir -U -r requirements.txt
    fi
    deactivate
fi

# Activate ${PYTHON_ENV} & print $(pwd)
source "${PYTHON_VENV}"/bin/activate
echo "Using: $(python3 -V)"
echo "Currently on $(pwd)"
