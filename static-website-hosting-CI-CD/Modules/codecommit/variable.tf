variable "codecommit_repo" {
  type = object({
    name        = string
    description = string
  })
}
