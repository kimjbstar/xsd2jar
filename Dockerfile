# Base image with JDK and necessary tools
FROM openjdk:8

# Set working directory
WORKDIR /app

# Copy the xsd files to the container
COPY xsd /app/xsd

# Copy the necessary JAR files to the container
COPY libs /app/libs

# Copy the script to the container
COPY script.sh /app/script.sh

# Run the script at runtime
CMD ["sh", "/app/script.sh"]
