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

resource "github_repository" "newrepo" {
  name        = "My_first_repo"
  description = "Trying out new things with terraform"

  visibility = "public"
}


Remember that when creating your token, you must tick the different acesses like repo(to create repo), delete_repo(to delete repo) to the token to be able to create and delete token, otherwise, you maybe experiencing 404 error.
The resource name should not have spaces
if you want to delete only a resource using terraform, use the terraform destroy -target "github resource"."resourcename"

