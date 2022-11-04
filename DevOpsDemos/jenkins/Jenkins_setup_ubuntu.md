## Install Jenkins on Ubuntu VM

### Minimum Hardware requirements to 
- 1 GB+ recommended
- 10 GB is a recommended

### Install Java
```
sudo sudo apt update
sudo apt install wget tar openjdk-8-jdk
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt install jenkins
systemctl status Jenkins
java -version
```

### Start Jenkins service
```
sudo systemctl start jenkins
sudo systemctl enable jenkins
```

### Enable port 8080/tcp on the firewall
```
sudo ufw allow 8080
sudo ufw status
```

### Access Jenkins web URL
```
http://[serverip_or_hostname]:8080
```
