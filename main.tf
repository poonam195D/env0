module "network" {
  depends_on           = [module.create_onboarding]
  source               = "git::ssh://git@bitbucket.org/energycomponents/$reponame/src/$branchname//env0_setup/terraform/?ref=$tagname"
  name                 = "-network"
  repository           = "https://${var.bitbucket_username}@bitbucket.org/${var.teamsinspace}/${var.repo_name}.git"
  description          = "network"
  job_path             = "cluster/infrastructure/network"
  terraform_version    = var.terraform_version
  revision             = var.repo_master_branch
  template_type        = "terraform"
  bitbucket_client_key = var.bitbucket_client_key
  projectid            = var.projectid
  env0_ssh_name        = [data.env0_ssh_key.my_key]
}
