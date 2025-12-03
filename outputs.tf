output "vpc" {
  description = "VPC"
  value       = aws_vpc.kdzdo-vpc.id
}

output "public-subnet-a" {
  description = "Subnet-a"
  value       = aws_subnet.kdzdo-subnet-a-public.id
}

output "public-subnet-b" {
  description = "Subnet-b"
  value       = aws_subnet.kdzdo-subnet-b-public.id
}

output "public-subnet-c" {
  description = "Subnet-c"
  value       = aws_subnet.kdzdo-subnet-c-public.id
}

output "public-rta" {
  description = "Route table association"
  value       = aws_route_table.kdzdo-rt-public.id
}

output "private-subnet-a" {
  description = "Subnet-a"
  value       = aws_subnet.kdzdo-subnet-a-private.id
}

output "private-subnet-b" {
  description = "Subnet-b"
  value       = aws_subnet.kdzdo-subnet-b-private.id
}

output "private-subnet-c" {
  description = "Subnet-c"
  value       = aws_subnet.kdzdo-subnet-c-private.id
}

output "private-rta" {
  description = "Route table association"
  value       = aws_route_table.kdzdo-rt-private.id
}

output "sg" {
  description = "Security_group"
  value       = aws_security_group.kdzdo-default-sg.id
}
