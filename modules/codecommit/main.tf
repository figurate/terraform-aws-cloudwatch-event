data "aws_codecommit_repository" "repository" {
  repository_name = var.repository_name
}

module "event_trigger" {
  source = "../.."

  description  = var.description
  name         = var.name
  event_source = "aws.codecommit"
  event_types  = ["CodeCommit Repository State Change"]
  source_arns  = [data.aws_codecommit_repository.repository.arn]
  event_detail = {
    event         = ["referenceCreated", "referenceUpdated"]
    referenceType = ["branch"]
    referenceName = [var.repository_branch]
  }
  target_arn  = var.target_arn
  target_name = var.target_name
  target_role = var.target_role
}
