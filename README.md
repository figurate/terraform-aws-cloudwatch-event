# ![AWS](aws-logo.png) CloudWatch Event Rule

[![CI](https://github.com/figurate/terraform-aws-cloudwatch-event/actions/workflows/main.yml/badge.svg)](https://github.com/figurate/terraform-aws-cloudwatch-event/actions/workflows/main.yml)

![AWS CloudWatch Event Rule](aws\_cloudwatch\_event\_rule.png)

Purpose: Templates for CloudWatch Event rules.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| description | Trigger description | `any` | n/a | yes |
| event\_detail | A map of configuration data specific to the event type | `map(any)` | `{}` | no |
| event\_source | Source of events for this rule | `any` | `null` | no |
| event\_types | A list of event types to monitor from the event source | `list(string)` | `[]` | no |
| frequency\_cron | A CRON expression defining the trigger schedule | `any` | `null` | no |
| frequency\_rate | A rate of scheduled triggering | `any` | `null` | no |
| frequency\_type | A predefined frequency for scheduled triggering (required if `trigger_arn` not specified) | `string` | `"hourly_on_weekdays"` | no |
| name | Name of the CloudWatch Event trigger | `any` | n/a | yes |
| source\_arns | A list of ARNs used to filter the monitored source | `list` | `[]` | no |
| tags | Tags for the event rule | `map(any)` | `{}` | no |
| target\_arn | ARN of the CloudWatch Event target | `any` | n/a | yes |
| target\_name | Function name for Lambda targets (used to configure invocation permissions) | `any` | `null` | no |
| target\_role | Name of the IAM role assumed by the target | `any` | n/a | yes |

## Outputs

No output.

