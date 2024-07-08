module "oidc" {
  source = "./modules/iam/oidc"
}

module "terraform_access" {
  source       = "./modules/iam/role/terraform_access"
  oidc         = module.oidc.oidc_arn
  organization = var.GITHUB_ORGANIZATION
  repository   = var.GITHUB_REPOSITORY
  environment  = var.GITHUB_ENVIRONMENT
}

module "terraform_state_store" {
  source     = "./modules/tfstate_store"
  project    = var.PROJECT
  random_key = var.RANDOM_KEY
}