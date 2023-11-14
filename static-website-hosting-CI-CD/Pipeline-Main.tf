module "codecommit" {
  source = "./Modules/codecommit"
  codecommit_repo = {
    name        = var.codecommit_repo.name
    description = var.codecommit_repo.description
  }
  environment = var.environment
}

module "codebuild" {
  source      = "./Modules/codebuild"
  environment = var.environment
}

module "codepipeline" {
  source = "./Modules/codepipeline"
  codecommit_repo = {
    name = var.codecommit_repo.name
  }
  codebuild_project = {
    name = module.codebuild.codebuild_project.name
  }
  deploy_s3_bucket = {
    name = var.s3_bucket.name
    arn  = module.s3_bucket.static_webiste_bucket.bucket_arn
  }
}
