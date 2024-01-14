## Install Jenkins Master on Centos VM

### Minimum Hardware requirements

- 1 GB+ recommended
- 10 GB is a recommended

### OS update Packages
```
sudo yum update -y
```

### Install Java
```
sudo yum -y install epel-release
sudo yum -y install vim wget docker java-11-openjdk
```

### Install Jenkins Server on CentOS 7
```
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum -y update && yum -y install jenkins
```

### Enable port 8080/tcp on the firewall
```
sudo firewall-cmd --add-port=8080/tcp --permanent && firewall-cmd --reload && firewall-cmd --list-all
```

### Start Jenkins service
```
sudo systemctl enable jenkins && systemctl start jenkins
```

### Access Jenkins web URL
```
http://[serverip_or_hostname]:8080
```
