output "source1_private_ip" {
  value = aws_instance.source1.private_ip
}

output "source2_private_ip" {
  value = aws_instance.source2.private_ip
}

output "destination1_private_ip" {
  value = aws_instance.destination1.private_ip
}

output "destination2_private_ip" {
  value = aws_instance.destination2.private_ip
}

output "test1_private_ip" {
  value = aws_instance.test1.private_ip
}