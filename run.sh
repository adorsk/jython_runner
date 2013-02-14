#!/bin/bash
echo "starting...this can take some time to load..."

# -------------------
# SETTINGS
# Change settings here.
# -------------------

# Max memory program can use. In some cases seting this
# to a higher value can improve speed.
MAX_MEM="512m"

# -------------------
# CORE
# Don't change stuff below unless
# you know what you're doing...
# -------------------

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

JYTHON_CMD="$DIR/.jython/jython"
JAVA_LIBS="$DIR/.lib/java/*.jar"
PYTHON_PATH=""

for lib in $JAVA_LIBS; do 
  PYTHON_PATH="$PYTHON_PATH:$lib"
  CLASSPATH="$CLASSPATH:$lib"
done
export CLASSPATH

$JYTHON_CMD -J-Xmx$MAX_MEM -Dpython.path="$PYTHON_PATH:$DIR/.lib/python" -m entrypoint
