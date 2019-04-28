#Bob Aiello
### We create a simply WAR file using a maven archetype 

$ mvn archetype:generate

### We select the archetype that generates a starter Java EE 7 application that can run in wildfly
### remote -> org.wildfly.archetype:wildfly-javaee7-webapp-archetype (An archetype that generates a starter Java EE 7 webapp project for JBoss Wildfly)
 
```
myArtifactID: Assortment of technologies including Arquillian
========================
Define value for property 'groupId': myGroupID
Define value for property 'artifactId': myArtifactID
Define value for property 'version' 1.0-SNAPSHOT: :
Define value for property 'package' myGroupID: :
[INFO] Using property: name = Java EE 7 webapp project
Confirm properties configuration:
groupId: myGroupID
artifactId: myArtifactID
version: 1.0-SNAPSHOT
package: myGroupID
name: Java EE 7 webapp project
 Y: :
[INFO] ----------------------------------------------------------------------------
[INFO] Using following parameters for creating project from Archetype: wildfly-javaee7-webapp-archetype:8.2.0.Final
[INFO] ----------------------------------------------------------------------------
[INFO] Parameter: groupId, Value: myGroupID
[INFO] Parameter: artifactId, Value: myArtifactID
[INFO] Parameter: version, Value: 1.0-SNAPSHOT
[INFO] Parameter: package, Value: myGroupID
[INFO] Parameter: packageInPathFormat, Value: myGroupID
[INFO] Parameter: package, Value: myGroupID
[INFO] Parameter: version, Value: 1.0-SNAPSHOT
[INFO] Parameter: name, Value: Java EE 7 webapp project
[INFO] Parameter: groupId, Value: myGroupID
[INFO] Parameter: artifactId, Value: myArtifactID
[WARNING] CP Don't override file /home/vagrant/mvnwildflyexample/mavenwildflyexample/myArtifactID/src/main/webapp/WEB-INF/templates/default.xhtml
[INFO] Project created from Archetype in dir: /home/vagrant/mvnwildflyexample/mavenwildflyexample/myArtifactID
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 1:11.908s
[INFO] Finished at: Sun Jul 01 16:46:00 UTC 2018
[INFO] Final Memory: 13M/60M
[INFO] ------------------------------------------------------------------------
```

