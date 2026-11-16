terraform {
  backend "s3" {
    bucket  = "terraform-state-networking7"
    key     = "sandbox/terraform.tfstate"
    region  = "ap-southeast-1"
    encrypt = true
  }
}
