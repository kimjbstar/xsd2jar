#!/bin/sh

set -e

mkdir -p /app/classes/
mkdir -p /app/gen/

# Set input and output directories
XSD_INPUT_DIR="/app/xsd/"
JAR_OUTPUT_DIR="/app/jar/"

if [ -z "$(ls -A $XSD_INPUT_DIR)" ]; then
  echo "directory is empty. terminate..."
  exit 1
else
  echo "xsd files found. keep going..."
fi

# Run xjc script to compile xsd files to Java
xjc $XSD_INPUT_DIR/*.xsd -d /app/gen/

count=$(find /app/gen/* -name "*.java" | grep -c ".java")
 
if [ $count -eq 0 ]; then
  echo "converted files not found. terminte..."
  exit 1
else
  echo "total $count java files generated."
fi

# Compile the generated Java sources to a JAR file
javac -source 1.8 -target 1.8 -cp "/app/libs/jaxb-impl-2.3.1.jar:/app/libs/jaxb-api-2.3.1.jar" -d /app/classes $(find /app/gen/* | grep .java)

echo "jar start....."

jar cvf /app/${JAR_FILE_NAME}.jar -C /app/classes/** .

# Move the JAR file to the specified output directory
mv /app/${JAR_FILE_NAME}.jar $JAR_OUTPUT_DIR/
