## Install Jenkins Master on Centos VM

### Minimum Hardware requirements

- 1 GB+ recommended
- 10 GB is a recommended

### System upgrade
```
sudo yum update -y
```

### Install Java
```
sudo yum -y install epel-release
sudo yum -y install vim wget docker java-11-openjdk
```

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

### Install Jenkins Server on CentOS 7
```
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum update -y
sudo yum install jenkins -y
```

### Enable port 8080/tcp on the firewall
```
sudo firewall-cmd --add-port=8080/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-all
```

### Start Jenkins service
```
sudo systemctl enable jenkins
sudo systemctl start jenkins
```

### Access Jenkins web URL
```
http://[serverip_or_hostname]:8080
```
