# Building the Metasploit container

docker build -t mymetasploit .

docker run -p 8080:8080 -d mymetasploit

docker exec -it mymetasploit /bin/bash
