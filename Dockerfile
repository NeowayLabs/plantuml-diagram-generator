# Docker file from https://github.com/lindt/docker_plantuml
# We have updated the plantuml version to support Plantuml for C4 diagrams

FROM openjdk:17-jdk-slim
ENV PLANTUML_VERSION=1.2022.6
RUN apt update -y && apt upgrade -y
RUN apt install graphviz wget ca-certificates fontconfig -y
WORKDIR /plantuml-files
RUN wget "http://downloads.sourceforge.net/project/plantuml/${PLANTUML_VERSION}/plantuml.${PLANTUML_VERSION}.jar" -O plantuml.jar
WORKDIR /plantuml
RUN ["java", "-Djava.awt.headless=true", "-jar", "/plantuml-files/plantuml.jar", "-version"]
RUN ["dot", "-version"]
