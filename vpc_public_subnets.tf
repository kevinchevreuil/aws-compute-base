resource "aws_route_table" "kaisen-rt-public" {
  vpc_id = aws_vpc.kaisen-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.kaisen-ig.id
  }
  tags = {
    "Name" = "kaisen-route-table-public"
  }
}

resource "aws_subnet" "kaisen-subnet-a-public" {
  vpc_id                  = aws_vpc.kaisen-vpc.id
  cidr_block              = "10.2.1.0/24"
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true
  depends_on              = [aws_internet_gateway.kaisen-ig]
  tags = {
    "Name" = "kaisen-subnet-a-public"
  }
}

resource "aws_route_table_association" "kaisen-rta-a-public" {
  subnet_id      = aws_subnet.kaisen-subnet-a-public.id
  route_table_id = aws_route_table.kaisen-rt-public.id
}

resource "aws_subnet" "kaisen-subnet-b-public" {
  vpc_id                  = aws_vpc.kaisen-vpc.id
  cidr_block              = "10.2.2.0/24"
  availability_zone       = "${var.aws_region}b"
  map_public_ip_on_launch = true
  depends_on              = [aws_internet_gateway.kaisen-ig]
  tags = {
    "Name" = "kaisen-subnet-b-public"
  }
}

resource "aws_route_table_association" "kaisen-rta-b-public" {
  subnet_id      = aws_subnet.kaisen-subnet-b-public.id
  route_table_id = aws_route_table.kaisen-rt-public.id
}

resource "aws_subnet" "kaisen-subnet-c-public" {
  vpc_id                  = aws_vpc.kaisen-vpc.id
  cidr_block              = "10.2.3.0/24"
  availability_zone       = "${var.aws_region}c"
  map_public_ip_on_launch = true
  depends_on              = [aws_internet_gateway.kaisen-ig]
  tags = {
    "Name" = "kaisen-subnet-c-public"
  }
}

resource "aws_route_table_association" "kaisen-rta-c-public" {
  subnet_id      = aws_subnet.kaisen-subnet-c-public.id
  route_table_id = aws_route_table.kaisen-rt-public.id
}
