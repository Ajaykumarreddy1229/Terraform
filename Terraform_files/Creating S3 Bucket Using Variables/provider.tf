terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.73.1"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}
