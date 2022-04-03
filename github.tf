terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}
provider "github" {
  token = "ghp_gS8t0ossfsdgsgsdgsaF6Wfhgdfgdg4btRRR"
}

resource "github_repository" "others" {
  name        = "Other-stuffs"
  description = "Collection of codes"

  visibility = "public"
}


Remember that when creating your token, you must tick access to the token to be able to create token, otherwise, you maybe experiencing 404 error.
