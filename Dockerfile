FROM maven:3.8.1-openjdk-8 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn package

FROM anilkumar1146/tomcat:1.0
RUN mkdir -p /usr/local/tomcat/webapps
RUN chmod -R 777 /usr/local/tomcat/conf
COPY --from=build /app/target/helloworld-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/helloworld.war
