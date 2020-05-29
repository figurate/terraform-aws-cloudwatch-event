data "aws_codecommit_repository" "repository" {
  repository_name = var.repository_name
}

module "event_trigger" {
  source = "../.."

  description     = var.description
  name            = var.name
  target_arn      = var.target_arn
  target_role     = var.target_role
  trigger_arn     = data.aws_codecommit_repository.repository.arn
  trigger_context = var.repository_branch
  trigger_type    = "codecommit"
}
