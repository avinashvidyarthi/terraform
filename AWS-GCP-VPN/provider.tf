terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.6.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.1"
    }
  }
}

provider "google" {
  project = var.gcp_info.project_id
  region  = var.gcp_info.region
}

provider "aws" {
  region  = var.aws_info.region
  profile = var.aws_info.profile
}

provider "external" {
  
}
