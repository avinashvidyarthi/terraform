module "s3_bucket" {
  source      = "./Modules/s3/bucket"
  bucket      = var.s3_bucket
  environment = var.environment
}

module "cloudfront" {
  source      = "./Modules/cloudfront"
  environment = var.environment
  static_webiste_bucket = {
    bucket_regional_domain_name = module.s3_bucket.static_webiste_bucket.bucket_regional_domain_name
  }
}

module "s3_policy" {
  source      = "./Modules/s3/policy"
  environment = var.environment
  static_webiste_bucket = {
    bucket_id  = module.s3_bucket.static_webiste_bucket.bucket_id
    bucket_arn = module.s3_bucket.static_webiste_bucket.bucket_arn
  }
  s3_distribution = {
    arn = module.cloudfront.s3_distribution.arn
  }
}
