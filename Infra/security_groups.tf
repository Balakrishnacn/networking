# Source security group
resource "aws_security_group" "source_sg" {
  name   = "source-sg"
  vpc_id = aws_vpc.source.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Destination Security group

resource "aws_security_group" "destination_sg" {
  name   = "destination-sg"
  vpc_id = aws_vpc.destination.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}