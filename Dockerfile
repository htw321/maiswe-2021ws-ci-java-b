#
# Build stage
#
FROM maven:3.6.0-jdk-11-slim AS build
RUN mkdir /build-dir
COPY src /build-dir/src
COPY pom.xml /build-dir
RUN mvn -f /build-dir/pom.xml clean package

# #
# # Package stage
# #
FROM openjdk:11-jre-slim
COPY --from=build /build-dir/target/*.jar /usr/local/lib/app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/app.jar"]