
resource "aws_cloudfront_origin_access_control" "s3_oac" {
  name                              = "s3_oac"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}


resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name              = var.static_webiste_bucket.bucket_regional_domain_name
    origin_id                = "static_bucket"
    origin_access_control_id = aws_cloudfront_origin_access_control.s3_oac.id
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "static_bucket"
    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }

  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["IN"]
    }
  }

  tags = {
    Environment = var.environment
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
