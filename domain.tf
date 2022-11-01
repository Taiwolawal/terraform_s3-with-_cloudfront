# create records for cloudfront
resource "aws_route53_record" "cloudfront_staging" {
  zone_id = var.zone_id
  name    = var.route53_name
  type    = var.route53_record

  alias {
    name                   = aws_cloudfront_distribution.cf_dist.domain_name
    zone_id                = aws_cloudfront_distribution.cf_dist.hosted_zone_id
    evaluate_target_health = true
  }
}