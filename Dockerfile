#
# Build stage
#
FROM maven:3.5-jdk-8 AS build 
COPY maven-web/src /home/app/src
COPY maven-web/pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

#
# Package stage
#
FROM gcr.io/distroless/java  
COPY --from=build /home/app/target/*.war /usr/local/lib/demo.war
EXPOSE 8081
ENTRYPOINT ["java","-jar","/usr/local/lib/demo.war"]
