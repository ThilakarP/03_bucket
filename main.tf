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
  region  = "us-west-2"

}

resource "aws_instance" "InstanceForIAM" {
  ami           = "ami-094125af156557ca2"
  instance_type = "t2.micro"

  tags = {
    Name = "Myserver via github actions"
  }
}


resource "aws_s3_bucket" "secondbucket" {
  bucket = "thilak-bucket-7587587845"
  
  
    tags = {
    Name        = "IAM Policy Bucket"
    Environment = "Dev"
  }
}

output "private_ip" {
  value = aws_instance.InstanceForIAM.private_ip
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