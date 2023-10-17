# Terraform Block
terraform {
  required_version = ">= 1.4" 
  required_providers {
    aws = {
      version = "~> 3.0"
    }
  }
}


# Provider Block
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}
/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/
# Create EC2 Instance
resource "aws_instance" "web" {
  ami           = "ami-053b0d53c279acc90" # Amazon Linux
  instance_type = "t2.micro"
   key_name     = "ec2-create"
  tags = {
    "Name" = "web"
  }
}
