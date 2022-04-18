terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.8.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_ec2" {
    ami = "ami-0c02fb55956c7d316"
    instance_type = "t2.micro"

    tags = {
      "Name" = "First EC2 from Terraform"
    }
}


Remember that the ami is dependent or subjected to the region. To get the ami, you can try to launch EC2 from GUI and then copy the ami
Remember also that the tag name will be the name of your EC2
  
  
  ---------------------------------------------------------------------
    EC2 with security group and s3 bucket
  
  terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.8.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_ec2" {
  ami                    = "ami-0c02fb55956c7d316"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]  #This links the resource aws security group to the EC2. Remember that securitty groups are already linked to EC2, therefore, it runs first before the EC2 is created.

  # A webserver is created inside <<-EOF EOF is used in writing multiple strings together.
  user_data = <<-EOF
            #!/bin/bash
            echo "Hello, World" > index.html
            nohup busybox httpd -f -p 8080 &
            EOF

  tags = {
    "Name" = "Web-server"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Can accept and send traffic to any IP addresses
  }
}


resource "aws_s3_bucket" "new-s3" {
  bucket = "my-tf-test-bucket19999"

  tags = {
    Name        = "My first bucket19999"
    Environment = "Dev"
  }
}
