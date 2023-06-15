FROM maven:3.8.6-openjdk-11 AS build
COPY maven-web/src/main/webapp /home/app/src
COPY maven-web/pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM tomcat:9.0.52-jdk11-openjdk-slim
COPY --from=build /home/app/target/maven-web.war /usr/local/tomcat/webapps/demo.war
EXPOSE 80
CMD ["catalina.sh", "pom.xml"]
