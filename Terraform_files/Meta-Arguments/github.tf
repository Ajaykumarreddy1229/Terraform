terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
}

provider "github" {}

resource "github_repository" "example" {
  name        = "tf-github-repo"
  description = "Created using Terraform"

  visibility = "public"
}
