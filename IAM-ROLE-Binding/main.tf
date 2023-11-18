terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.6.0"
    }
  }
}

provider "google" {
  project = var.project_id
}

resource "google_project_iam_binding" "role_binding" {
  for_each = var.permissions
  role     = each.key
  project  = var.project_id
  members  = formatlist("${var.user_type}:%s", each.value)
}
