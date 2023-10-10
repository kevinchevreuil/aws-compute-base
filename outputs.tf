output "vpc" {
  description = "VPC"
  value       = aws_vpc.kaisen-vpc.id
}

output "subnet-a" {
  description = "Subnet-a"
  value       = aws_subnet.kaisen-subnet-a.id
}

output "subnet-b" {
  description = "Subnet-b"
  value       = aws_subnet.kaisen-subnet-b.id
}

output "subnet-c" {
  description = "Subnet-c"
  value       = aws_subnet.kaisen-subnet-c.id
}

output "sg" {
  description = "Security_group"
  value       = aws_security_group.kaisen-default-sg.id
}
