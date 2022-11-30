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

provider "aws" {
  region  = "us-west-2"

}