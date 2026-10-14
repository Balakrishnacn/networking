resource "aws_security_group" "source_sg" {

  name   = "source-sg"
  vpc_id = aws_vpc.source_vpc.id

  ingress {

    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [var.my_ip]
  }

  egress {

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "destination_sg" {

  name   = "destination-sg"
  vpc_id = aws_vpc.destination_vpc.id

  ingress {

    description = "HTTP from source VPC"

    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {

    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [var.my_ip]
  }

  egress {

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }
}