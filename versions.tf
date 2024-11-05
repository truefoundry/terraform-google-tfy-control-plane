terraform {
  required_version = ">= 1.4"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.85.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}