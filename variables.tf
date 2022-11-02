variable "region" {
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

variable "bucket_pro" {
  type        = string
  description = "Name of created S3 bucket for pro"
  default     = "pro-staging-togetherall"
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

variable "acm_certificate" {
  type = string
  description = "acm certifacte for staging.togetherall.com"
  default     = "arn:aws:acm:eu-west-2:301776873719:certificate/227b0c3c-7174-4a99-aa4d-c357e4db3b9f"
}