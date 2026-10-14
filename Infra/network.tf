################################
# SOURCE VPC
################################

resource "aws_vpc" "source_vpc" {

  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "source-vpc"
  }
}

resource "aws_subnet" "source_subnet" {

  vpc_id                  = aws_vpc.source_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "source-subnet"
  }
}

resource "aws_internet_gateway" "source_igw" {

  vpc_id = aws_vpc.source_vpc.id
}

resource "aws_route_table" "source_rt" {

  vpc_id = aws_vpc.source_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.source_igw.id
  }
}

resource "aws_route_table_association" "source_assoc" {

  subnet_id      = aws_subnet.source_subnet.id
  route_table_id = aws_route_table.source_rt.id
}

################################
# DESTINATION VPC
################################

resource "aws_vpc" "destination_vpc" {

  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "destination-vpc"
  }
}

resource "aws_subnet" "destination_subnet" {

  vpc_id                  = aws_vpc.destination_vpc.id
  cidr_block              = "172.16.1.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "destination-subnet"
  }
}

resource "aws_internet_gateway" "destination_igw" {

  vpc_id = aws_vpc.destination_vpc.id
}

resource "aws_route_table" "destination_rt" {

  vpc_id = aws_vpc.destination_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.destination_igw.id
  }
}

resource "aws_route_table_association" "destination_assoc" {

  subnet_id      = aws_subnet.destination_subnet.id
  route_table_id = aws_route_table.destination_rt.id
}

################################
# VPC PEERING
################################

resource "aws_vpc_peering_connection" "peer" {

  vpc_id      = aws_vpc.source_vpc.id
  peer_vpc_id = aws_vpc.destination_vpc.id

  auto_accept = true

  tags = {
    Name = "source-destination-peer"
  }
}

################################
# ROUTES
################################

resource "aws_route" "source_to_destination" {

  route_table_id            = aws_route_table.source_rt.id
  destination_cidr_block    = "172.16.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

resource "aws_route" "destination_to_source" {

  route_table_id            = aws_route_table.destination_rt.id
  destination_cidr_block    = "10.0.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}