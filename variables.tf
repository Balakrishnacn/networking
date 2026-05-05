variable "aws_region" {
  default = "us-east-1"
}

variable "key_pair_name" {
  description = "Existing EC2 key pair name"
  type        = string
}

variable "my_ip" {
  description = "Your public IP for SSH (x.x.x.x/32)"
  type        = string
}