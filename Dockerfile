FROM tomcat:8

COPY ./webapp.war /usr/local/tomcat/webapps
#COPY target/*.war /usr/local/tomcat/webapps/
