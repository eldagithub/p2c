echo "Scope : docker ps -a -f 'name=webhost' : "
docker ps -a -f "name=webhost"


echo docker stop `docker ps -q -f "name=webhost"`
docker stop `docker ps -q -f "name=webhost"`


echo docker rm `docker ps -aq -f "name=webhost"`
docker rm `docker ps -aq -f "name=webhost"`

