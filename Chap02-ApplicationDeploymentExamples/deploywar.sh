#!/bin/bash
#Bob Aiello
#DeployWarStep1.sh

echo "DeployWarStep1.sh calculates SHA1 and then deploys WAR file"

sha1sum myArtifactID.war > mySHA1.txt

echo "display SHA1 for myArtifactID.war"
cat mySHA1.txt

echo "check it"
sha1sum -c mySHA1.txt

echo "copy myArtifactID.war and mySHA1.txt to web"
scp myArtifactID.war vagrant@web:/home/vagrant/wildfly/standalone/deployments
scp mySHA1.txt vagrant@web:/home/vagrant/wildfly/standalone/deployments

echo "checkit on web"
/usr/bin/ssh vagrant@web "cd /home/vagrant/wildfly/standalone/deployments; /usr/bin/sha1sum -c /home/vagrant/wildfly/standalone/deployments/mySHA1.txt > /home/vagrant/mySHA1.results"
scp vagrant@web:/home/vagrant/mySHA1.results .

echo "So does it match?"
cat mySHA1.results
