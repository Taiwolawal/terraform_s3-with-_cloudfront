module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.5.0"

  create_bucket = var.create_bucket

  bucket = var.bucket
  acl    = var.acl

  policy        = var.policy
  attach_policy = var.attach_policy

  versioning          = var.versioning
  object_lock_enabled = var.object_lock_enabled
}