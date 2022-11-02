terraform {
  backend "s3" {
    bucket         = var.bucket_statefile
    key            = "terraform.tfstate"
    region         = var.region
    encrypt        = true
  }
}