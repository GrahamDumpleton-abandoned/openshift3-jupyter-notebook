#!/bin/bash

JUPYTER_NOTEBOOK_DIR=${JUPYTER_NOTEBOOK_DIR:-$WARPDRIVE_SRC_ROOT}

JUPYTER_NOTEBOOK_CONFIG=$WARPDRIVE_APP_ROOT/tmp/jupyter_notebook_config.py

touch $JUPYTER_NOTEBOOK_CONFIG

cat >> $JUPYTER_NOTEBOOK_CONFIG << !
import os

password = os.environ.get('JUPYTER_USER_PASSWORD')

if password:
    import notebook.auth

    c.NotebookApp.password = notebook.auth.passwd(password)

    del password
    del os.environ['JUPYTER_USER_PASSWORD']
!

exec jupyter notebook --no-browser --debug --log-level=DEBUG \
    --ip=* --port=8080 --config=$JUPYTER_NOTEBOOK_CONFIG \
    --notebook-dir=$JUPYTER_NOTEBOOK_DIR
