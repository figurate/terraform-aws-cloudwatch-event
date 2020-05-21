# ![AWS](aws-logo.png) CloudWatch Event Trigger

Purpose: Templates for CloudWatch Event triggers.

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
| name | Name of the CloudWatch Event trigger | `any` | n/a | yes |
| target\_arn | ARN of the CloudWatch Event target | `any` | n/a | yes |
| target\_role | Name of the IAM role assumed by the target | `any` | n/a | yes |
| trigger\_arn | ARN of the event trigger | `any` | n/a | yes |
| trigger\_context | Additional contextual value relevant to the event trigger | `any` | n/a | yes |
| trigger\_type | The type of event trigger (used to derive trigger rules) | `any` | n/a | yes |

## Outputs

No output.

