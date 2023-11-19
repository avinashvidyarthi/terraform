output "s3_distribution" {
  value = {
    arn = aws_cloudfront_distribution.s3_distribution.arn
  }
}
