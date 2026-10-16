resource "aws_instance" "source1" {

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.source_subnet.id
  vpc_security_group_ids = [aws_security_group.source_sg.id]
  key_name               = var.key_pair_name

  tags = {
    Name = "source-1"
  }
}

resource "aws_instance" "source2" {

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.source_subnet.id
  vpc_security_group_ids = [aws_security_group.source_sg.id]
  key_name               = var.key_pair_name

  tags = {
    Name = "source-2"
  }
}

resource "aws_instance" "destination1" {

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.destination_subnet.id
  vpc_security_group_ids = [aws_security_group.destination_sg.id]
  key_name               = var.key_pair_name

  tags = {
    Name = "destination-1"
  }
}

resource "aws_instance" "destination2" {

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.destination_subnet.id
  vpc_security_group_ids = [aws_security_group.destination_sg.id]
  key_name               = var.key_pair_name

  tags = {
    Name = "destination-2"
  }
}

resource "aws_instance" "test1" {

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.test_subnet.id
  vpc_security_group_ids = [aws_security_group.test_sg.id]
  key_name               = var.key_pair_name

  tags = {
    Name = "test-1"
  }
}