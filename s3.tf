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

resource "aws_s3_bucket" "new-s3" {
  bucket = "my-tf-test-bucket19999"

  tags = {
    Name        = "My first bucket19999"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.new-s3.id
  acl    = "private"
}
