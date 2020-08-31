FROM tomcat:latest
MAINTAINER slitobo <slitobo@163.com>
USER root
ADD target/*.war /opt/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
