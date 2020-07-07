FROM maven:3.6.3-jdk-8-slim AS base
WORKDIR /app
EXPOSE 8080
#
# Build stage
#
FROM maven:3.6.3-jdk-8-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package
RUN ls
#
# package stage
#
FROM openjdk:8-jdk-alpine AS publish
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
COPY --from=build /home/app/target/*.jar /home/app/app.jar
ENTRYPOINT ["sh","-c","java -jar /home/app/app.jar"]
#
# final stage
#
FROM openjdk:8-jdk-alpine AS final
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
COPY --from=build /home/app/target/*.jar /home/app/app.jar
ENTRYPOINT ["sh","-c","java -jar /home/app/app.jar"]
