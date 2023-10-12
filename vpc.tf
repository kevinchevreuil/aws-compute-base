resource "aws_vpc" "kaisen-vpc" {
  cidr_block           = "10.2.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    "Name" = "vpc-kaisen"
  }
}

resource "aws_internet_gateway" "kaisen-ig" {
  vpc_id = aws_vpc.kaisen-vpc.id
  tags = {
    "Name" = "kaisen-internet-gateway"
  }
}
