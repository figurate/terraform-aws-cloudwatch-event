## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| description | Trigger description | `any` | n/a | yes |
| frequency\_cron | A CRON expression defining the trigger schedule | `any` | `null` | no |
| frequency\_rate | A rate of scheduled triggering | `any` | `null` | no |
| frequency\_type | A predefined frequency for scheduled triggering (required if `trigger_arn` not specified) | `any` | n/a | yes |
| name | Name of the CloudWatch Event trigger | `any` | n/a | yes |
| target\_arn | ARN of the CloudWatch Event target | `any` | n/a | yes |
| target\_name | Function name for Lambda targets (used to configure invocation permissions) | `any` | `null` | no |
| target\_role | Name of the IAM role assumed by the target | `any` | n/a | yes |

## Outputs

No output.

