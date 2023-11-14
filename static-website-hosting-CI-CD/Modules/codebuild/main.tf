data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "code_build_role" {
  name               = "code-build-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "code_build_role_policy" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "code_build_role_policy" {
  role   = aws_iam_role.code_build_role.name
  policy = data.aws_iam_policy_document.code_build_role_policy.json
}

resource "aws_codebuild_project" "codebuild_project" {
  name          = "static-webiste-build-project"
  description   = "static-webiste-build-project"
  build_timeout = 60
  service_role  = aws_iam_role.code_build_role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
  }

  logs_config {
    cloudwatch_logs {
      group_name = "codebuild"
      status     = "ENABLED"
    }
  }

  source {
    type            = "CODEPIPELINE"
    git_clone_depth = 1

  }

  source_version = "main"

  tags = {
    Environment = var.environment
  }
}
