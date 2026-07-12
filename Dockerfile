# Tomcat 9 + JDK 11 — hosts the JSP leakage webapp
FROM tomcat:9.0-jdk11-temurin

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Deploy project as /leakage context
COPY leakage/ /usr/local/tomcat/webapps/leakage/

EXPOSE 8080

CMD ["catalina.sh", "run"]
