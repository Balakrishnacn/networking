resource "aws_vpc_peering_connection" "peer" {
  vpc_id      = aws_vpc.source.id
  peer_vpc_id = aws_vpc.destination.id
  auto_accept = true
}