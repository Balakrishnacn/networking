resource "aws_vpc" "source" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "source-vpc"
  }
}

resource "aws_subnet" "source_subnet" {
  vpc_id                  = aws_vpc.source.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "source-subnet"
  }
}

