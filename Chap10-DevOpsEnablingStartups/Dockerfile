#Dockerfile for simple node app
FROM node:10

# Create app directory
WORKDIR /usr/src/app

#Copy in package.json
COPY package*.json ./

#install npm (using package.json)
RUN npm install && npm install -g nodemon
RUN apt-get update && apt-get install -y vim

# copy in server.js
COPY server.js .
COPY README.md .

EXPOSE 8080
CMD [ "nodemon", "server.js" ]
