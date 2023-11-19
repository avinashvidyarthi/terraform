output "codecommit_repo" {
  value = {
    name = aws_codecommit_repository.codecommit_repo.repository_id
  }
}
