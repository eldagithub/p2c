#./0-docker-install.sh
#ret=$?;if [ ! $ret = 0 ]; then exit $ret; fi


echo "-----------------------------------------"
id
echo "-----------------------------------------"
groups
echo "-----------------------------------------"

sleep 5  ; echo ./1-buildDB.sh
./1-buildDB.sh
ret=$?;if [ ! $ret = 0 ]; then exit $ret; fi


sleep 5  ; echo ./2-db-init.sh
./2-db-init.sh
ret=$?;if [ ! $ret = 0 ]; then exit $ret; fi


sleep 5  ; echo ./3-tomcat-build.sh
./3-tomcat-build.sh
ret=$?;if [ ! $ret = 0 ]; then exit $ret; fi


sleep 5  ; echo ./4-tomcat-run.sh
./4-tomcat-run.sh
ret=$?;if [ ! $ret = 0 ]; then exit $ret; fi


sleep 15 ; clear  ; echo ./5-tomcat-test.sh
./5-tomcat-test.sh
ret=$?;if [ ! $ret = 0 ]; then exit $ret; fi

#sleep 5  ; echo ./6-tomcat-stop.sh
#./6-tomcat-stop.sh
#ret=$?;if [ ! $ret = 0 ]; then exit $ret; fi


