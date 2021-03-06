#!/bin/bash

export GATEWAY=`netstat -nr | awk '/^0\.0\.0\.0/ { print $2 }'`
export LEIN="lein"

case "$1" in
    'bash')    exec bash ;;
    'repl')    exec $LEIN repl :headless \
                               :host 0.0.0.0 \
                               :port ${REPL_PORT:-5888} ;;
    *)         exec $LEIN $@ ;;
esac
