resource "aws_vpc" "kdzdo-vpc" {
  cidr_block           = "10.2.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    "Name" = "Kdzdo VPC"
  }
}

resource "aws_internet_gateway" "kdzdo-ig" {
  vpc_id = aws_vpc.kdzdo-vpc.id
  tags = {
    "Name" = "Kdzdo Internet Gateway"
  }
}
