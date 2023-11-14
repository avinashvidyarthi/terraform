output "codebuild_project" {
  value = {
    name = aws_codebuild_project.codebuild_project.name
  }
}
