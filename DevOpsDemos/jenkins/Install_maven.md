## Download & configure Maven for Java based Projects
```
sudo wget https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz -P /opt
cd /opt && sudo tar xvf apache-maven-3.8.6-bin.tar.gz
sudo mv apache-maven-3.8.6 apache-maven
mvn -v
```

### Set maven environment variables
```
sudo vi /etc/profile.d/maven.sh
export JAVA_HOME=/usr/lib/jvm/default-java
export MAVEN_HOME=/opt/apache-maven-3.8.6
export PATH=${MAVEN_HOME}/bin:${PATH}
```

```
sudo chmod +x /etc/profile.d/maven.sh
sudo source /etc/profile.d/maven.sh
```
