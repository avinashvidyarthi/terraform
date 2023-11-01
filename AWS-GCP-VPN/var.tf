# ------------Terraform Setup Variables------------

variable "gcp_info" {
  type = object({
    project_id = string
    region     = string
    vpc_name   = string
  })
}

variable "aws_info" {
  type = object({
    account_id      = string
    region          = string
    profile         = string
    vpc_id          = string
    route_table_ids = list(string)
  })
}

variable "gcp_ha_vpn_gateway" {
  type = object({
    name = string
  })
}

