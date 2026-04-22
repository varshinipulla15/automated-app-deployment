provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "devops_sg" {
  name = "devops-sg"

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "devops_server" {
  ami           = "ami-098e39bafa7e7303d" # Amazon Linux (may change per region)
  instance_type = "t2.micro"

  security_groups = [aws_security_group.devops_sg.name]

  tags = {
    Name = "DevOps-Project-Server"
  }
}