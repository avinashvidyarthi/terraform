module "codecommit" {
  source = "./Modules/codecommit"
  codecommit_repo = {
    name        = var.codecommit_repo.name
    description = var.codecommit_repo.description
  }
  environment = var.environment
}
