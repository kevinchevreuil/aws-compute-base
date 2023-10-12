output "vpc" {
  description = "VPC"
  value       = aws_vpc.kaisen-vpc.id
}

output "public-subnet-a" {
  description = "Subnet-a"
  value       = aws_subnet.kaisen-subnet-a-public.id
}

output "public-subnet-b" {
  description = "Subnet-b"
  value       = aws_subnet.kaisen-subnet-b-public.id
}

output "public-subnet-c" {
  description = "Subnet-c"
  value       = aws_subnet.kaisen-subnet-c-public.id
}

output "public-rta" {
  description = "Route table association"
  value       = aws_route_table.kaisen-rt-public.id
}

output "private-subnet-a" {
  description = "Subnet-a"
  value       = aws_subnet.kaisen-subnet-a-private.id
}

output "private-subnet-b" {
  description = "Subnet-b"
  value       = aws_subnet.kaisen-subnet-b-private.id
}

output "private-subnet-c" {
  description = "Subnet-c"
  value       = aws_subnet.kaisen-subnet-c-private.id
}

output "private-rta" {
  description = "Route table association"
  value       = aws_route_table.kaisen-rt-private.id
}

output "sg" {
  description = "Security_group"
  value       = aws_security_group.kaisen-default-sg.id
}
