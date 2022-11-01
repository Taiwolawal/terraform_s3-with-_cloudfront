# create S3 Bucket for pro and network:
resource "aws_s3_bucket" "network" {
  bucket = var.bucket_network

  tags = {
    "ManagedBy" = "Terraform"
  }

  force_destroy = true
}

resource "aws_s3_bucket" "pro" {
  bucket = var.bucket_pro

  tags = {
    "ManagedBy" = "Terraform"
  }

  force_destroy = true
}

# create bucket ACL for both pro and network  :
resource "aws_s3_bucket_acl" "network_acl" {
  bucket = aws_s3_bucket.network.id
  acl    = "private"
}

resource "aws_s3_bucket_acl" "pro_acl" {
  bucket = aws_s3_bucket.pro.id
  acl    = "private"
}



# block public access to pro and network bucket :
resource "aws_s3_bucket_public_access_block" "public_block_network" {
  bucket = aws_s3_bucket.network.id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}

resource "aws_s3_bucket_public_access_block" "public_block_pro" {
  bucket = aws_s3_bucket.pro.id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}


# encrypt bucket using SSE-S3 to pro and network bucket :
resource "aws_s3_bucket_server_side_encryption_configuration" "encrypt_network" {
  bucket = aws_s3_bucket.network.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encrypt_pro" {
  bucket = aws_s3_bucket.pro.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# create S3 website hosting for pro and network:
resource "aws_s3_bucket_website_configuration" "website_network" {
  bucket = aws_s3_bucket.network.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_website_configuration" "website_pro" {
  bucket = aws_s3_bucket.pro.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}



# add bucket policy to let the CloudFront OAI get objects:
resource "aws_s3_bucket_policy" "bucket_policy_network" {
  bucket = aws_s3_bucket.network.id
  policy = data.aws_iam_policy_document.bucket_policy_document.json
}

resource "aws_s3_bucket_policy" "bucket_policy_pro" {
  bucket = aws_s3_bucket.pro.id
  policy = data.aws_iam_policy_document.bucket_policy_document.json
}