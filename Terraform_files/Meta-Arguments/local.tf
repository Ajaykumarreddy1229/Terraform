terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

provider "local" {}

resource "local_file" "one" {
  filename = "test.txt"
  content  = "This file was created using Terraform Local Provider"
}
