# builder stage compila il jar con Maven (Wrapper se presente)
FROM maven:3.9.2-eclipse-temurin-17 AS builder
WORKDIR /workspace
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src ./src
RUN chmod +x mvnw && \
    if [ -f mvnw ]; then ./mvnw -B package -DskipTests; else mvn -B package -DskipTests; fi

# runtime minimale
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=builder /workspace/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
