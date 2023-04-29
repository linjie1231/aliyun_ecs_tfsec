terraform {
  required_providers {
    alicloud = {
      source  = "hashicorp/alicloud"
      version = "1.165.0"
    }
  }
}

provider "alicloud" {
  region     = var.verify_key.region
  access_key = var.verify_key.access_key
  secret_key = var.verify_key.secret_key
}
