#!/usr/bin/env bash

QMK_ENV=".venv"

# Change initial directory & print $(pwd)
cd ./scr

sudo apt update
sudo apt-get install -f -y git python3-pip python3-venv

# If QMK_ENV environment doesn't exist
if [ ! -d ${PYTHON_VENV} ]; then
    python3 -m venv "${PYTHON_VENV}" --prompt 'dev.venv'
    source "${PYTHON_VENV}"/bin/activate
    python3 -m pip install qmk
fi

echo "Currently on $(pwd)"
echo "Check if qmk has been setup."
echo "Otherwise run:"
echo "cd /workspaces/QMK/scr; qmk setup -y -H ./qmk_firmware;"
echo "qmk config user.overlay_dir=\"$(realpath qmk_userspace)\""
echo "qmk userspace-compile -c -t"
