terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.1"
    }
  }
}

provider "aws" {
  region  = "ap-south-1"
  profile = "test-aws"
}

variable "bucket" {
  default = {
    name = "some-website-hosting-bucket-876431"
  }
}

resource "aws_s3_bucket" "static_webiste_bucket" {
  bucket = var.bucket.name

  tags = {
    Name = var.bucket.name
  }
}

resource "aws_s3_bucket_public_access_block" "static_webiste_bucket_block_public_access" {
  bucket                  = aws_s3_bucket.static_webiste_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


resource "aws_cloudfront_origin_access_control" "s3_oac" {
  name                              = "s3_oac"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}


resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name              = aws_s3_bucket.static_webiste_bucket.bucket_regional_domain_name
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

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

resource "aws_s3_bucket_policy" "allow_s3_access_policy" {
  bucket = aws_s3_bucket.static_webiste_bucket.id
  policy = data.aws_iam_policy_document.allow_s3_access_policy_document.json
}

data "aws_iam_policy_document" "allow_s3_access_policy_document" {
  statement {
    sid = "access_s3_from_cloudfront"
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.static_webiste_bucket.arn}/*"]
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [aws_cloudfront_distribution.s3_distribution.arn]
    }
  }
}
