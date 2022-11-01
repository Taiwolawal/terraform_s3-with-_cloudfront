terraform {
  backend "s3" {
    bucket         = var.bucket
    key            = "staging/terraform.tfstate"
    region         = var.region
    encrypt        = true
  }
}