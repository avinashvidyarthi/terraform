variable "codecommit_repo" {
  type = object({
    name = string
  })
}

variable "codebuild_project" {
  type = object({
    name = string
  })
}

variable "deploy_s3_bucket" {
  type = object({
    name = string
    arn  = string
  })
}
