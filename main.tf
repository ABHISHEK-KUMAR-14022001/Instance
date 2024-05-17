terraform {
  required_version = ">= 1.4" 

  required_providers {
    aws = {
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket         = "store-the-data"  # Change to your desired bucket name
    key            = "terraform/state/terraform.tfstate"  # Adjust key/path as needed
    region         = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"  # Specify your desired region here
}

resource "aws_s3_bucket" "store_the_data" {
  bucket = "store-the-data"
  acl    = "private"  # Adjust ACL as needed
  tags   = {
    Name        = "TerraformStateBucket"
    Environment = "Production"
  }
}

resource "aws_vpc" "main" {
  cidr_block          = "10.0.0.0/16"  # Specify the CIDR block for your VPC
  enable_dns_support  = true
  enable_dns_hostnames = true

  tags = {
    Name = "my-vpc"
  }
}

output "vpc_id" {
  value = aws_vpc.main.id
}
