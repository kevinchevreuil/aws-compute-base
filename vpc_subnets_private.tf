resource "aws_route_table" "kdzdo-rt-private" {
  vpc_id = aws_vpc.kdzdo-vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.kdzdo-nat-gw.id
  }
  tags = {
    "Name" = "Kdzdo Private Route Table"
  }
}

resource "aws_subnet" "kdzdo-subnet-a-private" {
  vpc_id                  = aws_vpc.kdzdo-vpc.id
  cidr_block              = "10.2.100.0/24"
  availability_zone       = data.aws_availability_zones.az-checker.names[0]
  map_public_ip_on_launch = false
  depends_on              = [aws_internet_gateway.kdzdo-ig]
  tags = {
    "Name" = "Kdzdo Private Subnet A"
  }
}

resource "aws_route_table_association" "kdzdo-rta-a-private" {
  subnet_id      = aws_subnet.kdzdo-subnet-a-private.id
  route_table_id = aws_route_table.kdzdo-rt-private.id
}

resource "aws_subnet" "kdzdo-subnet-b-private" {
  vpc_id                  = aws_vpc.kdzdo-vpc.id
  cidr_block              = "10.2.101.0/24"
  availability_zone       = data.aws_availability_zones.az-checker.names[1]
  map_public_ip_on_launch = false
  depends_on              = [aws_internet_gateway.kdzdo-ig]
  tags = {
    "Name" = "Kdzdo Private Subnet B"
  }
}

resource "aws_route_table_association" "kdzdo-rta-b-private" {
  subnet_id      = aws_subnet.kdzdo-subnet-b-private.id
  route_table_id = aws_route_table.kdzdo-rt-private.id
}

resource "aws_subnet" "kdzdo-subnet-c-private" {
  vpc_id                  = aws_vpc.kdzdo-vpc.id
  cidr_block              = "10.2.102.0/24"
  availability_zone       = data.aws_availability_zones.az-checker.names[2]
  map_public_ip_on_launch = false
  depends_on              = [aws_internet_gateway.kdzdo-ig]
  tags = {
    "Name" = "Kdzdo Private Subnet C"
  }
}

resource "aws_route_table_association" "kdzdo-rta-c-private" {
  subnet_id      = aws_subnet.kdzdo-subnet-c-private.id
  route_table_id = aws_route_table.kdzdo-rt-private.id
}

resource "aws_eip" "kdzdo-nat-gw-eip" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.kdzdo-ig]
}

resource "aws_nat_gateway" "kdzdo-nat-gw" {
  allocation_id = aws_eip.kdzdo-nat-gw-eip.id
  subnet_id     = aws_subnet.kdzdo-subnet-a-public.id
  tags = {
    "Name" = "Kdzdo Public/Private NAT Gateway"
  }
}
