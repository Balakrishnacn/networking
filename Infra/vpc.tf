############################################
# VPC
############################################
resource "aws_vpc" "sandbox_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "sandbox-vpc"
  }
}

############################################
# Internet Gateway
# (Required to make subnets public)
############################################
resource "aws_internet_gateway" "sandbox_igw" {
  vpc_id = aws_vpc.sandbox_vpc.id

  tags = {
    Name = "sandbox-igw"
  }
}

############################################
# Source Subnet (Public)
############################################
resource "aws_subnet" "src_subnet" {
  vpc_id                  = aws_vpc.sandbox_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "${var.aws_region}a"

  # This ensures EC2 launched here
  # automatically gets a Public IP
  map_public_ip_on_launch = true

  tags = {
    Name = "src-subnet"
  }
}

############################################
# Destination Subnet (Public)
############################################
resource "aws_subnet" "dst_subnet" {
  vpc_id                  = aws_vpc.sandbox_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "${var.aws_region}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "dst-subnet"
  }
}

############################################
# Public Route Table
############################################
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.sandbox_vpc.id

  # THIS is what makes a subnet "public"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sandbox_igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

############################################
# Route Table Association
# (This step is CRITICAL)
############################################

# Associate source subnet with public route table
resource "aws_route_table_association" "src_subnet_assoc" {
  subnet_id      = aws_subnet.src_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# Associate destination subnet with public route table
resource "aws_route_table_association" "dst_subnet_assoc" {
  subnet_id      = aws_subnet.dst_subnet.id
  route_table_id = aws_route_table.public_rt.id
}