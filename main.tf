/**
 * # ![AWS](aws-logo.png) CloudWatch Event Trigger
 *
 * ![AWS CloudWatch Event Rule](aws_cloudwatch_event_rule.png)
 *
 * Purpose: Templates for CloudWatch Event triggers.
 */
data "aws_iam_role" "target_role" {
  count = var.target_role != null ? 1 : 0
  name  = var.target_role
}

data "template_file" "event_pattern" {
  count    = var.frequency_type != null ? 1 : 0
  template = <<EOF
{
  "source": ["$${EventSource}"],
  "detail-type": $${EventTypes}
  $${Resources}$${Detail}
}
EOF
  vars = {
    EventSource = var.event_source
    EventTypes  = jsonencode(var.event_types)
    Resources   = length(var.source_arns) > 0 ? ",\n${jsonencode(var.source_arns)}" : ""
    Detail      = length(var.event_detail) > 0 ? ",\n${jsonencode(var.event_detail)}" : ""
  }
}

resource "aws_cloudwatch_event_rule" "trigger" {
  name                = var.name
  description         = var.description
  event_pattern       = var.frequency_type == null ? data.template_file.event_pattern[0].rendered : null
  schedule_expression = var.frequency_type != null ? local.frequency[var.frequency_type] : null
}

resource "aws_cloudwatch_event_target" "target" {
  arn      = var.target_arn
  role_arn = var.target_role != null ? data.aws_iam_role.target_role[0].arn : null
  rule     = aws_cloudwatch_event_rule.trigger.name
}

resource "aws_lambda_permission" "trigger" {
  count         = var.target_name != null ? 1 : 0
  statement_id  = var.name
  action        = "lambda:InvokeFunction"
  function_name = var.target_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.trigger.arn
}
