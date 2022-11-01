variable "region" {
  default = "us-west-2"
}

variable "bucket" {
  type        = string
  description = "Name of created S3 bucket"
  default     = "cloudfront-togetherall-bucket"
}

variable "domain_name" {
  type        = string
  description = "The domain name to use"
  default     = "demo.hands-on-cloud.com"
}

variable "zone_id" {
  type = string
  description = "The zone id for the domain"
  default     = ""
}

variable "route53_name" {
  type = string
  description = "Record name for cloudfront"
  default     = "cloudfront.staging.togetherall.com"
}

variable "route53_record" {
  type = string
  description = "Record type for cloudfront"
  default     = "A"
}

variable "acm_certificate" {
  type = string
  description = Record name for cloudfront
  default     = ""
}