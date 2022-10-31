terraform {
  backend "s3" {
    bucket         = "bucket_name"
    key            = "terraform.tfstate"
    region         = "region"
    encrypt        = true
  }
}