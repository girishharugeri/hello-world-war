FROM maven:3.8.2-openjdk-8 as maven_build_stage
WORKDIR /my-maven-dir/
COPY . .
RUN mvn clean package

FROM tomcat:9.0
COPY --from=maven_build_stage /my-maven-dir/target/hello-world-war-null.war /usr/local/tomcat/webapps

