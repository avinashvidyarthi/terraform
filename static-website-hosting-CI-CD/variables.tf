variable "aws_info" {
  type = object({
    region  = string
    profile = string
  })
}

variable "environment" {
  type = string
}

variable "s3_bucket" {
  type = object({
    name = string
  })
}

variable "codecommit_repo" {
  type = object({
    name        = string
    description = string
  })
}
