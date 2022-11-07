#creating OAI for network:
resource "aws_cloudfront_origin_access_identity" "oai_network" {
  comment = "OAI for ${var.route53_name}"
}

# Retrieve ACM for cloudfront in us-east-1
data "aws_acm_certificate" "cloudfront" {
  provider    = aws.global
  domain      = "togetherall.com"
  types       = ["AMAZON_ISSUED"]
  statuses = ["ISSUED"]
  most_recent = true
}

#creating cloudfront distribution for network:
resource "aws_cloudfront_distribution" "network" {
  provider            = aws.global
  enabled             = true
  default_root_object = "index.html"

  origin {
    domain_name = aws_s3_bucket.network.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.network.id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai_network.cloudfront_access_identity_path
    }
  }

  aliases = ["cloudfront.staging.togetherall.com"]


  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    cached_methods         = ["GET", "HEAD", "OPTIONS"]
    target_origin_id       = aws_s3_bucket.network.id
    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      headers      = []
      query_string = true

      cookies {
        forward = "all"
      }
    }

  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    "ManagedBy" = "Terraform"
  }

  viewer_certificate {
    acm_certificate_arn      = "${data.aws_acm_certificate.cloudfront.arn}"
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2018"
  }
}

