### Download Maven Binary
```
sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz -P /opt
```

### Change directory to /opt, extract apache and rename extracted folder
```
cd /opt
sudo tar xvf apache-maven-3.9.6-bin.tar.gz
sudo mv apache-maven-3.9.6 apache-maven
```

### Create maven.sh & insert the parameter
sudo vim /etc/profile.d/maven.sh
```
export MAVEN_HOME=/opt/apache-maven
export PATH=${MAVEN_HOME}/bin:${PATH}
```

### Grant execute permission
```
sudo chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
```
