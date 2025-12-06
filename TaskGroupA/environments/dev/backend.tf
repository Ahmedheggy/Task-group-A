terraform {
  backend "s3" {
    bucket = "terraform-state-obelion-ahmed"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
