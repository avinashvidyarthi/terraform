variable "static_webiste_bucket" {
  type = object({
    bucket_regional_domain_name = string
  })
}

variable "environment" {
  type = string
}
