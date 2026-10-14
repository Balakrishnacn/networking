resource "aws_vpc" "destination" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "destination-vpc"
  }
}

resource "aws_subnet" "destination_subnet" {
  vpc_id                  = aws_vpc.destination.id
  cidr_block              = "172.16.1.0/24"
  availability_zone       = "${var.aws_region}b"
  map_public_ip_on_launch = true
}