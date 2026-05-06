FROM  maven:amazoncorretto AS builder

WORKDIR /Maven

COPY /Maven .

RUN mvn install

FROM tomcat:9.0

COPY --from=builder /target/war.war /usr/local/tomcat/webapps/war.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
