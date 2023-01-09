FROM maven:3.8.2-openjdk-8 as maven_build_stage
ARG MYPATH=/my-maven-dir
ARG BUILD_VERSION=1.0.1
WORKDIR ${MYPATH}
COPY . .
RUN mvn clean package

FROM tomcat:9.0
ARG MYPATH=/my-maven-dir
ARG BUILD_VERSION=1.0.1
COPY --from=maven_build_stage ${MYPATH}/target/hello-world-war-${BUILD_VERSION}.war /usr/local/tomcat/webapps

