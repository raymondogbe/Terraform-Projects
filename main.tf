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
