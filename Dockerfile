FROM  maven:amazoncorretto AS builder

WORKDIR /Maven

COPY /Maven .

RUN mvn install

FROM tomcat:9.0

COPY --from=builder /app/target/app.war /usr/local/tomcat/webapps/app.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
