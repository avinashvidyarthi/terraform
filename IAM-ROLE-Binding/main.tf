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
  project = var.project_id
  role    = var.role
  members = formatlist("${var.user_type}:%s", var.emails)
}
