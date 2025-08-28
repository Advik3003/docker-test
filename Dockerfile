# Stage 1: Build Stage
FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Use Maven to package the application into a JAR file
RUN mvn clean package -DskipTests
# Stage 2: The Run Stage
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
CMD ["java", "-jar", "app.jar"]

# Expose the port your application will run on
EXPOSE 8080
# Command to run the application