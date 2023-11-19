resource "aws_s3_bucket_policy" "allow_s3_access_policy" {
  bucket = var.static_webiste_bucket.bucket_id
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
    resources = ["${var.static_webiste_bucket.bucket_arn}/*"]
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [var.s3_distribution.arn]
    }
  }
}
