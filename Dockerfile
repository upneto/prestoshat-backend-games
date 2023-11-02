# Maven
FROM maven:3-jdk-11
ADD . /prestoshat-backend-games
WORKDIR /prestoshat-backend-games
RUN ls -l
RUN mvn clean install

# Java App
FROM openjdk:11-jdk
VOLUME /tmp
COPY --from=0 "/prestoshat-backend-games/target/prestoshat-backend-games-*.jar" app.jar
CMD [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]