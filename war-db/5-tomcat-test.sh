if ! [ "$1" -ge 1024 ] 2>/dev/null
then
    PORT="8080"
else
    PORT=$1
fi


echo curl $(hostname):$PORT
curl $(hostname):$PORT

echo  ""


