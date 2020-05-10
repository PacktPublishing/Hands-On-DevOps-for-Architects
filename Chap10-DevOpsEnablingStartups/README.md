# nodeexample1
# Node example code with Dockerfile

## package.json is used by the *npm install* to download and install the version of express required

## server.js displays a simple message

## Dockerfile creates the docker image and copies in the package.json and server.js

### runit.bat shows the commands to build the docker image and run the example which are:

* docker build -t mynodeexample1 .

* docker run -p 8080:8080 -d mynodeexample1
