#
# Build stage
#
FROM maven:3.6.0-jdk-11-slim AS build
COPY maven-web/src /home/app/src
COPY maven-web/pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

#
# Package stage
#
FROM openjdk:11-jre-slim
COPY --from=build /home/app/target/*.war /usr/local/lib/demo.war
EXPOSE 8081
ENTRYPOINT ["java","-jar","/usr/local/lib/demo.jar"]
