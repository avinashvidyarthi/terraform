resource "aws_codecommit_repository" "codecommit_repo" {
  repository_name = var.codecommit_repo.name
  description     = var.codecommit_repo.description
  tags = {
    Name        = var.codecommit_repo.name
    Environment = var.environment
  }
}
