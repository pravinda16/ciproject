# Use an official OpenJDK runtime as the base image
FROM openjdk:8-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file built by your Java application to the container
COPY target/test-java-app.jar .

# Expose a port that your application listens on (e.g., 8080)
EXPOSE 8080

# Define the command to run your Java application
CMD ["java", "-jar", "test-java-app.jar"]
