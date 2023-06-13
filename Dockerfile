#
# Build stage
#
FROM maven:3.8.6-openjdk-11 AS build
COPY maven-web/src /home/app/src
COPY maven-web/pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package
RUN "ls -R /home/"
COPY /home/app/target/*.war /usr/local/lib/demo.war
EXPOSE 80
ENTRYPOINT ["java","-jar","/usr/local/lib/demo.war"]
