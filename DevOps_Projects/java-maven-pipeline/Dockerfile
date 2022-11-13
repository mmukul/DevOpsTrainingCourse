FROM openjdk:8
WORKDIR /root/
ADD /var/jenkins/workspace/Docker_demo_project/DevOps_Projects/java-maven-pipeline/target/my-app-1.0.jar my-app-1.0.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/my-app-1.0.jar"]