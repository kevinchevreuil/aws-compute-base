resource "aws_route_table" "kaisen-rt-private" {
  vpc_id = aws_vpc.kaisen-vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.kaisen-nat-gw.id
  }
  tags = {
    "Name" = "kaisen-route-table-private"
  }
}

resource "aws_subnet" "kaisen-subnet-a-private" {
  vpc_id                  = aws_vpc.kaisen-vpc.id
  cidr_block              = "10.2.100.0/24"
  availability_zone       = data.aws_availability_zones.az-checker.names[0]
  map_public_ip_on_launch = false
  depends_on              = [aws_internet_gateway.kaisen-ig]
  tags = {
    "Name" = "kaisen-subnet-a-private"
  }
}

resource "aws_route_table_association" "kaisen-rta-a-private" {
  subnet_id      = aws_subnet.kaisen-subnet-a-private.id
  route_table_id = aws_route_table.kaisen-rt-private.id
}

resource "aws_subnet" "kaisen-subnet-b-private" {
  vpc_id                  = aws_vpc.kaisen-vpc.id
  cidr_block              = "10.2.101.0/24"
  availability_zone       = data.aws_availability_zones.az-checker.names[1]
  map_public_ip_on_launch = false
  depends_on              = [aws_internet_gateway.kaisen-ig]
  tags = {
    "Name" = "kaisen-subnet-b-private"
  }
}

resource "aws_route_table_association" "kaisen-rta-b-private" {
  subnet_id      = aws_subnet.kaisen-subnet-b-private.id
  route_table_id = aws_route_table.kaisen-rt-private.id
}

resource "aws_subnet" "kaisen-subnet-c-private" {
  vpc_id                  = aws_vpc.kaisen-vpc.id
  cidr_block              = "10.2.102.0/24"
  availability_zone       = data.aws_availability_zones.az-checker.names[2]
  map_public_ip_on_launch = false
  depends_on              = [aws_internet_gateway.kaisen-ig]
  tags = {
    "Name" = "kaisen-subnet-c-private"
  }
}

resource "aws_route_table_association" "kaisen-rta-c-private" {
  subnet_id      = aws_subnet.kaisen-subnet-c-private.id
  route_table_id = aws_route_table.kaisen-rt-private.id
}

resource "aws_eip" "kaisen-nat-gw-eip" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.kaisen-ig]
}

resource "aws_nat_gateway" "kaisen-nat-gw" {
  allocation_id = aws_eip.kaisen-nat-gw-eip.id
  subnet_id     = aws_subnet.kaisen-subnet-a-public.id
}
