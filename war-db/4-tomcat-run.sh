docker load -i target/pabwar-dockimages.tar

docker run -d --rm --name webhost8090 -h webhost8090 -p 8090:8080 pabwar
