/**
 * # ![AWS](aws-logo.png) CloudWatch Event Trigger
 *
 * Purpose: Templates for CloudWatch Event triggers.
 */
data "aws_iam_role" "target_role" {
  count = var.target_role != null ? 1 : 0
  name  = var.target_role
}

resource "aws_cloudwatch_event_rule" "trigger" {
  name          = var.name
  description   = var.description
  event_pattern = local.triggers[var.trigger_type]
}

resource "aws_cloudwatch_event_target" "target" {
  arn      = var.target_arn
  role_arn = var.target_role != null ? data.aws_iam_role.target_role[0].arn : null
  rule     = aws_cloudwatch_event_rule.trigger.name
}
