
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"  # Specify the CIDR block for your VPC
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "my-vpc"
  }
}

output "vpc_id" {
  value = aws_vpc.main.id
}
