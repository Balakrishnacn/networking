variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "key_pair_name" {
  description = "Existing EC2 key pair name"
  type        = string
}

variable "my_ip" {
  description = "Your public IP for SSH (x.x.x.x/32)"
  type        = string
}

# This is a test