provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

resource "aws_instance" "my_terratest" {
  ami                    = "ami-09e67e426f25ce0d7"
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.newwebaccess.id]

  user_data = <<-EOF
        #!/bin/bash
        apt update
        apt install -y nginx
        sudo service nginx start
        EOF

  tags = {
    "Name" = "NewEC2Instance"
  }
}

resource "aws_security_group" "newwebaccess" {
  name = "newwebaccess"

  ingress {
    description = "instance ingress security group"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }
  egress {
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
  }
}