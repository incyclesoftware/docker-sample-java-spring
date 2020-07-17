ARG BUILD_IMAGE=maven:3.6.3-jdk-8-slim
ARG RUNTIME_IMAGE=openjdk:11-jdk-slim

FROM ${BUILD_IMAGE} AS base
WORKDIR /app
EXPOSE 8080
#
# Build stage
#
FROM base AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package
#
# package stage
#
FROM ${RUNTIME_IMAGE} 
#RUN groupadd -g 1000 spring && useradd -u 1000 -G spring -s /bin/sh -D spring
#RUN addgroup -S spring && adduser -S spring -G spring
#USER spring:spring
COPY --from=build /home/app/target/*.jar /home/app/app.jar
ENTRYPOINT ["sh","-c","java -jar /home/app/app.jar"]