FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG JAVA_OPTS
ENV JAVA_OPTS=$JAVA_OPTS
ADD dockerfilesamples.jar dockerfilesamples.jar
EXPOSE 80
ENTRYPOINT exec java $JAVA_OPTS -jar dockerfilesamples.jar