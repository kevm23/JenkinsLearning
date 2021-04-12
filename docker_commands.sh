# prefix commands with sudo if user is not in docker group
# build docker image
docker build -t pipelearning/myapp .

# check docker image
docker images | grep pipelearning/myapp

# run docker container
docker run -p 8888:5000 --name myapp pipelearning/myapp
