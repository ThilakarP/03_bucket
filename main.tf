terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}
provider "aws" {
    profile="default"
    region="us-east-1"
  
}

resource "aws_instance" "InsThilak03" {
  ami                    = "ami-0b0dcb5067f052a63"
  instance_type          = "t2.micro"

   tags = {
    Name = "Myserver for logs"
  }
}

/*
resource "aws_s3_bucket" "firstbucket" {
  bucket = "tfs-bucket"
}
*/
output "private_ip" {
  value =aws_instance.InsThilak03.private_ip
}

 

/*
resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}
*/