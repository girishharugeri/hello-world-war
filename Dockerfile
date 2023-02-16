FROM maven:3.6.3-openjdk-11.0.17 as maven_build_stage
ARG MYPATH=/my-maven-dir
ARG BUILD_VERSION=1.0.1
ENV BUILD_VERSION=${BUILD_VERSION}
WORKDIR ${MYPATH}
COPY . .
RUN mvn clean package

FROM tomcat:9.0
ARG MYPATH=/my-maven-dir
ARG BUILD_VERSION=1.0.1
ENV BUILD_VERSION=${BUILD_VERSION}
COPY --from=maven_build_stage ${MYPATH}/target/hello-world-war-${BUILD_VERSION}.war /usr/local/tomcat/webapps

