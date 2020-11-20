#./0-docker-install.sh
clear ; echo ./1-buildDB.sh
./1-buildDB.sh

clear ; echo ./2-db-init.sh
./2-db-init.sh

clear ; echo ./3-tomcat-build.sh
./3-tomcat-build.sh

clear ; echo ./4-tomcat-run.sh
./4-tomcat-run.sh

sleep 10
clear ; echo ./5-tomcat-test.sh
./5-tomcat-test.sh

#clear ; echo ./6-tomcat-stop.sh
#./6-tomcat-stop.sh
