resource "aws_s3_bucket" "static_webiste_bucket" {
  bucket = var.bucket.name

  tags = {
    Name        = var.bucket.name
    Environment = var.environment
  }
}

resource "aws_s3_bucket_public_access_block" "static_webiste_bucket_block_public_access" {
  bucket                  = aws_s3_bucket.static_webiste_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}



