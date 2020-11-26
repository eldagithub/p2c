
mkdir -p  target/datadir
cp src/db.sql target/datadir/

docker stop `docker ps -q -f "name=mysql1"`
docker rm `docker ps -q -f "name=mysql1"`

docker run --name=mysql1 -e MYSQL_ROOT_PASSWORD=pass -p 3306:3306 --user $(id -u):$(id -g)  --mount type=bind,src=$(pwd)/src/my.cnf,dst=/etc/my.cnf    --mount type=bind,src=$(pwd)/target/datadir,dst=/var/lib/mysql    -d mysql:5.6
#docker run --name=mysql1 -e MYSQL_ROOT_PASSWORD=pass -p 3306:3306    --mount type=bind,src=$(pwd)/src/my.cnf,dst=/etc/my.cnf       -d mysql:5.6

echo "Checking ..... "

cnt=0
while true
do


if docker logs mysql1 2>/dev/stdout | grep "mysqld: ready for connections" 1>/dev/null 
then 
	echo "DB correctly started"  
        exit 0
fi

((cnt++))

if [[ "$cnt" == '10' ]]; then
    
  echo ""
  echo ""
  echo "Logs still not getting OK ..."
  echo "Please check"
  exit 10
fi

echo -n ".."
sleep 2
done




