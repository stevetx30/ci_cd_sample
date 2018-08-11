FROM ubuntu:16.04

RUN apt-get update

RUN apt-get install -y wget

RUN apt-get install -y zip

RUN wget -q -O - http://pkg.jenkins.io/debian/jenkins-ci.org.key | apt-key add -

RUN sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

RUN apt-get update

RUN apt-get install -y default-jre

RUN apt-get install -y jenkins



#### Nexus ###
RUN wget http://download.sonatype.com/nexus/3/latest-unix.tar.gz -P /home

RUN mkdir /opt/nexus

RUN echo "64aa21a4d2505b2f46fd65c838c4a737  /home/latest-unix.tar.gz" | md5sum -c -

RUN mv /home/latest-unix.tar.gz /opt/nexus

RUN tar -xzf /opt/nexus/latest-unix.tar.gz



### Postgres ####
RUN apt-get -y install postgresql postgresql-contrib


### Sonar ####
RUN mkdir /opt/sonar

RUN wget http://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-6.7.5.zip -P /home

RUN mv /home/sonarqube-6.7.5.zip /opt/sonar

RUN unzip /opt/sonar/sonarqube-6.7.5.zip


RUN apt-get install -y nano
### clean up tools ###
RUN apt-get remove -y wget
RUN apt-get remove -y zip

EXPOSE 8080
EXPOSE 8081