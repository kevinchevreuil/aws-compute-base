resource "aws_instance" "kaisen-ec2" {
  count                       = "1"
  ami                         = data.aws_ami.amazonlinux.id
  instance_type               = "t2.micro"
  key_name                    = "linux-key-pair"
  vpc_security_group_ids      = [aws_security_group.kaisen-default-sg.id]
  subnet_id                   = aws_subnet.kaisen-subnet-a-public.id
  associate_public_ip_address = "true"
  ebs_optimized               = "false"
  source_dest_check           = "false"
  tags = {
    Name = "kaisen-ec2"
  }
}
