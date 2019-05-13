# syntax = docker/dockerfile:1.0-experimental

#for JDK 11
#FROM maven:3.6.1-jdk-11-slim as builder
#RUN apt-get update && apt-get install -y git

#for JDK8
FROM maven:3.6.1-jdk-8-alpine as builder
RUN apk add --no-cache git

MAINTAINER ekimura kandalva@gmail.com

RUN git clone https://github.com/hapifhir/hapi-fhir-jpaserver-starter.git
WORKDIR /hapi-fhir-jpaserver-starter
COPY ./patch/hapi.properties /hapi-fhir-jpaserver-starter/src/main/resources/hapi.properties
COPY ./patch/jetty-web.xml /hapi-fhir-jpaserver-starter/src/main/webapp/WEB-INF/

RUN --mount=type=cache,target=/root/.m2 \
	mvn package -Dmaven.test.skip=true
#RUN mvn dependency:go-offline
#RUN mvn package -Dmaven.test.skip=true
#RUN mvn install -Dmaven.test.skip=true

#for JDK 11
#FROM jetty:9.4.18-jre11 as runner
#for JDK 8
FROM jetty:9-jre8-alpine

USER jetty:jetty
COPY --from=builder /hapi-fhir-jpaserver-starter/target/hapi-fhir-jpaserver.war /var/lib/jetty/webapps/root.war

#Create database data directory
RUN mkdir -p /var/lib/jetty/db_data
EXPOSE 8080
