
if ! [ "$1" -ge 1024 ] 2>/dev/null
then
    PORT="8080"
else
    PORT=$1
fi


docker load -i target/pabwar-dockimages.tar

echo docker run -d  --name webhost$PORT -h webhost$PORT -p $PORT:8080 pabwar
docker run -d  --name webhost$PORT -h webhost$PORT --add-host=debianbox:172.17.0.1 -p $PORT:8080 pabwar
