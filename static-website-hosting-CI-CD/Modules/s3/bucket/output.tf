output "static_webiste_bucket" {
  value = {
    bucket_regional_domain_name = aws_s3_bucket.static_webiste_bucket.bucket_regional_domain_name
    bucket_id                   = aws_s3_bucket.static_webiste_bucket.id
    bucket_arn                  = aws_s3_bucket.static_webiste_bucket.arn
  }
}
