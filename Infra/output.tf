output "source_public_ip" {
  value = aws_instance.source.public_ip
}

output "source_private_ip" {
  value = aws_instance.source.private_ip
}

output "destination_public_ip" {
  value = aws_instance.destination.public_ip
}

output "destination_private_ip" {
  value = aws_instance.destination.private_ip
}

output "source_vpc_id" {
  value = aws_vpc.source_vpc.id
}

output "destination_vpc_id" {
  value = aws_vpc.destination_vpc.id
}