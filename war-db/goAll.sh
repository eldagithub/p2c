#./0-docker-install.sh
echo ./1-buildDB.sh
./1-buildDB.sh

echo ./2-db-init.sh
./2-db-init.sh

echo ./3-tomcat-build.sh
./3-tomcat-build.sh

echo ./4-tomcat-run.sh
./4-tomcat-run.sh

echo ./5-tomcat-test.sh
./5-tomcat-test.sh

#echo ./6-tomcat-stop.sh
#./6-tomcat-stop.sh
