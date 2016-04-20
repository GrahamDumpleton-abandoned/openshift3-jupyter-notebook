#!/bin/bash

JUPYTER_NOTEBOOK_DIR=${JUPYTER_NOTEBOOK_DIR:-$WARPDRIVE_SRC_ROOT}

exec jupyter notebook --no-browser --debug --log-level=DEBUG \
    --notebook-dir=$JUPYTER_NOTEBOOK_DIR --ip=* --port=8080
