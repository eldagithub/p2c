echo "
#FROM vonv10/tomcat
FROM consol/tomcat-7.0

MAINTAINER elmos
# COPY path-to-your-application-war path-to-webapps-in-docker-tomcat
COPY pabfr.war /opt/apache-tomcat-7.0.62/webapps/
" > target/Dockerfile

docker image build -f target/Dockerfile -t pabwar ./src/

#docker save pabwar:latest -o target/pabwar-dockimages.tar


echo docker rmi `docker images pabwar -q`
docker stop `docker ps -q -f "name=webhost"`
docker rm `docker ps -q -f "name=webhost"`
#docker rmi `docker images pabwar -q`

