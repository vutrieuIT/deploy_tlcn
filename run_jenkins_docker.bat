docker run -d ^
--name jenkins ^ 
-p 8080:8080 ^ 
-p 50000:50000 ^ 
-v /usr/bin/docker:/usr/bin/docker ^
-v /var/run/docker.sock:/var/run/docker.sock ^
-v ./jenkins_home:/var/jenkins_home ^
jenkins/jenkins:lts-jdk17