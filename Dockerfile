FROM openjdk:17-jdk-slim
WORKDIR /app
COPY . .
RUN if [ -f ./mvnw ]; then chmod +x ./mvnw && ./mvnw -B clean package -DskipTests; else mvn -B clean package -DskipTests; fi
EXPOSE 8080
CMD ["sh", "-c", "java -jar target/*-SNAPSHOT.jar"]
