# Multi Stage Docker build example
## Overview
As part of our multi-part series on Docker containerization, InCycle Software has assembled a sample Java Spring Boot REST API that illustrates using multi-stage Docker builds. One of the most challenging things about building Docker images is keeping the image size to a minimum. With multi-stage builds, you use multiple FROM statements in your Dockerfile. This allows you to selectively copy artifacts from one stage to another, leaving behind everything you don’t want in the final image. 

In this sample three stages are used to produce the final Docker image
1. Base - which sets up initial base configuration required by subsequent stages
2. Build - this stage uses a Maven Docker Hub image to provide necessary dependencies to build the API and produce the final Jar file
3. Publish - This stage copies the Jar file(s) created by the build. A minimally provsioned openjdk image as the base for the production image.

## Prerequisites
Docker Desktop for Mac/Windows. 
You can verify Docker is running by executing  ```docker --version ``` from the command prompt.

## Walkthrough
To get started with this image run the following commands:

1. Build the Docker image
```bash
docker build . -t weather-forecast-api:v1
- or -
docker build . -t weather-forecast-api:v1 --target=publish
to target a specific stage
```
 2. Run the image and create the container.
```bash
docker run -p 8080:8080 weather-forecast-api:v1
```
3. Access the container to confirm it is working. 
```
http://localhost:8080/api/v1/resources/weatherforecast
```