#!/bin/bash

set -e

# disable max occur limit
export JAVA_TOOL_OPTIONS="-Djdk.xml.maxOccurLimit=0"

# Set input and output directories
XSD_INPUT_DIR="/app/xsd/"
GEN_DIR="/app/gen/"
CLASS_DIR="/app/classes/"

mkdir -p ${CLASS_DIR}
mkdir -p ${GEN_DIR}

TARGET_DIRS=$(ls -d $XSD_INPUT_DIR/*/)

if [ -z "$TARGET_DIRS" ]; then
  echo "Can't find targets. Terminating..."
  exit 1
else
  echo "XSD files found. Proceeding..."
fi

for TARGET_DIR in $TARGET_DIRS; do
  JAR_FILE_NAME=$(basename "$TARGET_DIR")
  
  # Run xjc script to compile xsd files to Java
  xjc $TARGET_DIR/*.xsd -d ${GEN_DIR}
  
  count=$(find ${GEN_DIR}* -name "*.java" | grep -c ".java")
  if [ $count -eq 0 ]; then
    echo "Converted files not found. Continuing..."
    continue
  else
    echo "Total $count Java files generated."
  fi
  
  # Compile the generated Java sources to a JAR file
  javac \
  -source 1.8 \
  -target 1.8 \
  -cp "/app/libs/*" \
  -d ${CLASS_DIR} $(find ${GEN_DIR}* -name "*.java")
  
  echo "Creating JAR..."
  jar cvf ${XSD_INPUT_DIR}/${JAR_FILE_NAME}.jar -C ${CLASS_DIR} .
done

