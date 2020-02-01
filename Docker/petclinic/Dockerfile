FROM ubuntu:18.04
RUN apt-get update && apt-get install openjdk-8-jdk -y
LABEL AUTHOR=santhu
ENV src https://qt-s3-new-testing.s3-us-west-2.amazonaws.com/spring-petclinic.jar
ENV target /spring-petclinic.jar
ADD  $src $target
ENTRYPOINT ["java", "-jar"]
CMD [ "spring-petclinic.jar" ]

