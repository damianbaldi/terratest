provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key  = "${var.aws_secret_key}"
    region = "${var.aws_region}"
}

resource "aws_instance" "my_terratest" {
    ami = "ami-09e67e426f25ce0d7"
    instance_type = "t2.micro"

    user_data = <<EOF
        #!/bin/bash
        apt update
        apt install -y nginx
        sudo service nginx start
        EOF

    tags = {
        "Name" = "NewEC2Instance"
    }
}