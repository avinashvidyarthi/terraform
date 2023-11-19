variable "static_webiste_bucket" {
  type = object({
    bucket_id = string
    bucket_arn = string
  })
}

variable "s3_distribution" {
    type = object({
        arn = string
    })
}

variable "environment" {
  type = string
}
