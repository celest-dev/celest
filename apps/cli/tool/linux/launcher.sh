#!/bin/sh

export LD_LIBRARY_PATH="$PWD:$LD_LIBRARY_PATH"
exec /opt/celest/celest $@
