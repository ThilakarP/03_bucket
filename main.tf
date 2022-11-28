terraform {

  backend "remote" {
    organization = "akshar"
    workspaces {
      name = "gh-actions-api-demo"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}

# An example resource that does nothing.
resource "null_resource" "example" {
  triggers = {
    value = "A example resource that does nothing!"
  }
}


provider "aws" {
  region  = "us-east-1"

}

resource "aws_instance" "InstanceForIAM" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"

  tags = {
    Name = "Myserver via github actions"
  }
}


resource "aws_s3_bucket" "firstbucket" {
  bucket = "IAM-bucket"

    tags = {
    Name        = "IAM Policy Bucket"
    Environment = "Dev"
  }
}

output "private_ip" {
  value = aws_instance.InsThilak03.private_ip
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