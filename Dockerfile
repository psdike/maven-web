FROM maven:3.8.6-openjdk-11 AS build
WORKDIR /home/app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

FROM tomcat:9.0.52-jdk11-openjdk-slim
COPY --from=build /home/app/target/*.war /usr/local/tomcat/webapps/demo.war
COPY src/main/webapp/WEB-INF /usr/local/tomcat/webapps/ROOT/WEB-INF
COPY src/main/webapp/index.jsp /usr/local/tomcat/webapps/ROOT/index.jsp
COPY src/main/webapp/web.xml /usr/local/tomcat/conf/web.xml
EXPOSE 8080
CMD ["catalina.sh", "run"]
