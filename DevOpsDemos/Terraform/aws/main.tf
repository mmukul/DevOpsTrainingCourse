provider "aws" {
     region = "ap-south-1"
}

# VPC
resource "aws_vpc" "vpc" {
  cidr_block       = "172.20.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my_vpc"
  }
}

# Public Subnet
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "172.20.10.0/24"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "public_subnet"
  }
}

# Private Subnet
resource "aws_subnet" "private" {
    vpc_id     = aws_vpc.vpc.id
    cidr_block = "172.20.20.0/24"
    availability_zone = "ap-south-1a"

    tags = {
      Name = "private_subnet"
  }
}

# Internet Gateway & attach with VPC
resource "aws_internet_gateway" "gateway" {
    vpc_id = aws_vpc.vpc.id

    tags = {
      Name = "vpc_gateway"
  }
}

# Routing table for IG: Public subnet
resource "aws_route_table" "route" {
    vpc_id = aws_vpc.vpc.id
       route {
       cidr_block = "0.0.0.0/0"
       gateway_id = aws_internet_gateway.gateway.id
}

    tags = {
       Name = "gatewayroute"
  }
}

resource "aws_route_table_association" "public" {
    subnet_id   = aws_subnet.public.id
    route_table_id = aws_route_table.route.id
}

# Security Group
resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Allow ssh and httpd inbound traffic"
  vpc_id      = "${aws_vpc.vpc.id}"
ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
ingress {
    description = "HTTP"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

tags = {
    Name = "my-sg"
  }
}

# Key Pair
resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ssh" {
  key_name = "task_key"
  public_key = tls_private_key.ssh.public_key_openssh
}

# Create EC2 instance
resource "aws_instance" "app" {
   ami = "ami-0ffc7af9c06de0077"
   instance_type = "t2.micro"
   associate_public_ip_address = true
   subnet_id = aws_subnet.public.id
   vpc_security_group_ids = [aws_security_group.sg.id]
   key_name = aws_key_pair.ssh.key_name
   
  }

tags = { 
         Name = "my-app"
     }