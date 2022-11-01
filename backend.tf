terraform {
  backend "s3" {
    bucket         = var.bucket
    key            = "terraform.tfstate"
    region         = "region"
    encrypt        = true
  }
}