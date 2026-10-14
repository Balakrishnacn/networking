variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "key_pair_name" {
  description = "Existing EC2 key pair name"
  type        = string
}

variable "my_ip" {
  description = "Public IP for SSH"
  type        = string
}