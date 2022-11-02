#creating OAI for network and pro:
resource "aws_cloudfront_origin_access_identity" "oai_network" {
  comment = "OAI for ${var.route53_name}"
}

resource "aws_cloudfront_origin_access_identity" "oai_pro" {
  comment = "OAI for ${var.route53_name}"
}

#creating CF distribution for network and pro :
resource "aws_cloudfront_distribution" "network" {
  enabled             = true
  default_root_object = "index.html"

  origin {
    domain_name = aws_s3_bucket.network.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.network.id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }

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
    acm_certificate_arn      = var.acm_certificate
  # ssl_support_method       = "sni-only"
  # minimum_protocol_version = "TLSv1.2_2018"
  }
}

resource "aws_cloudfront_distribution" "pro" {
  enabled             = true
  default_root_object = "index.html"

  origin {
    domain_name = aws_s3_bucket.pro.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.pro.id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    cached_methods         = ["GET", "HEAD", "OPTIONS"]
    target_origin_id       = aws_s3_bucket.pro.id
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
    acm_certificate_arn      = var.acm_certificate
  # ssl_support_method       = "sni-only"
  # minimum_protocol_version = "TLSv1.2_2018"
  }
}