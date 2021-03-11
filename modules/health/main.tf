module "cloudwatch_event" {
  source = "../.."

  description  = var.description
  name         = var.name
  event_source = "aws.health"
  event_types  = ["AWS Health Event"]
  target_arn   = var.target_arn
  target_name  = var.target_name
  target_role  = var.target_role
}
