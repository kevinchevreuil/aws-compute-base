data "aws_ami" "amazonlinux" {
  most_recent = true
  owners      = ["amazon"]
  name_regex  = "^amzn2-ami"
  filter {
    name      = "name"
    values    = ["amzn2-ami-hvm-*-gp2"]
  }

  filter {
    name      = "root-device-type"
    values    = ["ebs"]
  }

  filter {
    name      = "virtualization-type"
    values    = ["hvm"]
  }

  filter {
    name      = "architecture"
    values    = ["x86_64"]
  }
}

resource "aws_instance" "kaisen-ec2" {
  count                       = "1"
  ami                         = data.aws_ami.amazonlinux.id
  instance_type               = "t2.micro"
  key_name                    = "linux-key-pair"
  vpc_security_group_ids      = [aws_security_group.kaisen-default-sg.id]
  subnet_id                   = aws_subnet.kaisen-subnet-a.id
  associate_public_ip_address = "true"
  ebs_optimized               = "false"
  source_dest_check           = "false"
  tags = {
    Name = "kaisen-ec2"
  }
}
