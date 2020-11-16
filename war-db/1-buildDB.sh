
mkdir -p  target/datadir
cp src/db.sql target/datadir/

docker run --name=mysql1 -e MYSQL_ROOT_PASSWORD=pass -p 3306:3306    --mount type=bind,src=$(pwd)/src/my.cnf,dst=/etc/my.cnf    --mount type=bind,src=$(pwd)/target/datadir,dst=/var/lib/mysql    -d mysql:5.6


