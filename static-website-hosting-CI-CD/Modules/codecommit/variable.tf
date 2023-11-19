variable "codecommit_repo" {
  type = object({
    name        = string
    description = string
  })
}

variable "environment" {
  type = string
}
