resource "aws_instance" "source" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.source_subnet.id
  vpc_security_group_ids = [aws_security_group.source_sg.id]
  key_name               = var.key_pair_name

  tags = {
    Name = "source-instance"
  }
}

resource "aws_instance" "destination" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.destination_subnet.id
  vpc_security_group_ids = [aws_security_group.destination_sg.id]
  key_name               = var.key_pair_name

  tags = {
    Name = "destination-instance"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}