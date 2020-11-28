#./0-docker-install.sh


echo "-----------------------------------------"
id
echo "-----------------------------------------"
groups
echo "-----------------------------------------"

sleep 5  ; echo ./1-buildDB.sh
./1-buildDB.sh

sleep 5  ; echo ./2-db-init.sh
./2-db-init.sh

sleep 5  ; echo ./3-tomcat-build.sh
./3-tomcat-build.sh

sleep 5  ; echo ./4-tomcat-run.sh
./4-tomcat-run.sh

sleep 15 ; clear  ; echo ./5-tomcat-test.sh
./5-tomcat-test.sh

#sleep 5  ; echo ./6-tomcat-stop.sh
#./6-tomcat-stop.sh
