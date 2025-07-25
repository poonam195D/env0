terraform {
  required_providers {
    env0 = {
      source = "env0/env0"
    }
  }
}

resource "env0_template" "master" {
  name                 = var.name
  description          = var.description
  repository           = var.repository
  path                 = var.job_path
  terraform_version    = var.terraform_version
  revision             = var.revision
  type                 = var.template_type
  bitbucket_client_key = var.bitbucket_client_key
  ssh_keys             = var.env0_ssh_name
}

resource "env0_template_project_assignment" "assignment" {
  depends_on  = [env0_template.master]
  template_id = env0_template.master.id
  project_id  = var.projectid
}
