data "template_file" "trigger_codecommit" {
  template = file("${path.module}/templates/codecommit.json")
  vars = {
    RepositoryArn    = var.trigger_arn
    RepositoryBranch = var.trigger_context
  }
}

locals {
  triggers = {
    codecommit = data.template_file.trigger_codecommit.rendered
  }
}
