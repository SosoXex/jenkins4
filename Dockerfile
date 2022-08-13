FROM tomcat:10
COPY ./build/target/*.war /usr/local/tomcat/webapps/
