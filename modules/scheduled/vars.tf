variable "name" {
  description = "Name of the CloudWatch Event trigger"
}

variable "description" {
  description = "Trigger description"
}

variable "frequency_type" {
  description = "A predefined frequency for scheduled triggering (required if `trigger_arn` not specified)"
}

variable "frequency_rate" {
  description = "A rate of scheduled triggering"
  default     = null
}

variable "frequency_cron" {
  description = "A CRON expression defining the trigger schedule"
  default     = null
}

variable "target_arn" {
  description = "ARN of the CloudWatch Event target"
}

variable "target_role" {
  description = "Name of the IAM role assumed by the target"
}