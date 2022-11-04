variable "region" {
  default = "us-west-2"
}

variable "region_cloudfront" {
  default = "us-east-1"
}

variable "bucket_statefile" {
  type        = string
  description = "Name of created S3 bucket for statefile"
  default     = "cloudfront-togetherall-bucket"
}

variable "bucket_network" {
  type        = string
  description = "Name of created S3 bucket for network"
  default     = "network-staging-togetherall"
}

variable "domain_name" {
  type = string
  description = "Name of domain"
  default = "togetherall.com"
}


variable "zone_id" {
  type = string
  description = "The zone id for the domain"
  default     = "Z0569831M1DE65ERCMP4"
}

variable "route53_name" {
  type = string
  description = "Record name for cloudfront"
  default     = "cloudfront.staging.togetherall.com"
}

variable "route53_record_type" {
  type = string
  description = "Record type for cloudfront"
  default     = "A"
}

