FROM tomcat9
COPY ./build/target/*.war /usr/local/tomcat/webapps/
