# Use an official OpenJDK runtime as a base image
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR file into the container
COPY target/ci-cd-pipeline-1.0.jar ci-cd-pipeline.jar

# Command to run the JAR file
ENTRYPOINT ["java", "-jar", "ci-cd-pipeline.jar"]

# Expose port 8080
EXPOSE 8080

