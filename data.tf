data "aws_ami" "amazonlinux" {
  most_recent = true
  owners      = ["amazon"]
  name_regex  = "^al2023-ami"
  filter {
    name   = "name"
    values = ["al2023-ami*6.12*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "aws_availability_zones" "az-checker" {
  state = "available"
}
