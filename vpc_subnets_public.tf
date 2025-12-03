resource "aws_route_table" "kdzdo-rt-public" {
  vpc_id = aws_vpc.kdzdo-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.kdzdo-ig.id
  }
  tags = {
    "Name" = "Kdzdo Public Route Table"
  }
}

resource "aws_subnet" "kdzdo-subnet-a-public" {
  vpc_id                  = aws_vpc.kdzdo-vpc.id
  cidr_block              = "10.2.1.0/24"
  availability_zone       = data.aws_availability_zones.az-checker.names[0]
  map_public_ip_on_launch = true
  depends_on              = [aws_internet_gateway.kdzdo-ig]
  tags = {
    "Name" = "Kdzdo Public Subnet A"
  }
}

resource "aws_route_table_association" "kdzdo-rta-a-public" {
  subnet_id      = aws_subnet.kdzdo-subnet-a-public.id
  route_table_id = aws_route_table.kdzdo-rt-public.id
}

resource "aws_subnet" "kdzdo-subnet-b-public" {
  vpc_id                  = aws_vpc.kdzdo-vpc.id
  cidr_block              = "10.2.2.0/24"
  availability_zone       = data.aws_availability_zones.az-checker.names[1]
  map_public_ip_on_launch = true
  depends_on              = [aws_internet_gateway.kdzdo-ig]
  tags = {
    "Name" = "Kdzdo Public Subnet B"
  }
}

resource "aws_route_table_association" "kdzdo-rta-b-public" {
  subnet_id      = aws_subnet.kdzdo-subnet-b-public.id
  route_table_id = aws_route_table.kdzdo-rt-public.id
}

resource "aws_subnet" "kdzdo-subnet-c-public" {
  vpc_id                  = aws_vpc.kdzdo-vpc.id
  cidr_block              = "10.2.3.0/24"
  availability_zone       = data.aws_availability_zones.az-checker.names[2]
  map_public_ip_on_launch = true
  depends_on              = [aws_internet_gateway.kdzdo-ig]
  tags = {
    "Name" = "Kdzdo Public Subnet C"
  }
}

resource "aws_route_table_association" "kdzdo-rta-c-public" {
  subnet_id      = aws_subnet.kdzdo-subnet-c-public.id
  route_table_id = aws_route_table.kdzdo-rt-public.id
}
