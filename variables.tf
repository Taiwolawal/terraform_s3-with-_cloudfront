variable "region" {
  default = "us-east-1"
}

variable "bucket" {
  type        = string
  description = "Name of created S3 bucket"
  default     = "tf-s3-website-"
}

variable "domain_name" {
  type        = string
  description = "The domain name to use"
  default     = "demo.hands-on-cloud.com"
}