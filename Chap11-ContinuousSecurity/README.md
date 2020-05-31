# Building the Metasploit container

#First we build the docker image
docker build -t mymetasploit .

#We run the docker image and land in a command prompt
docker run -ti -p 8080:8080 mymetasploit /bin/bash

We can now run metasploit commands.
