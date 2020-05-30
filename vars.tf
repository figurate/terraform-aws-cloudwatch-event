variable "name" {
  description = "Name of the CloudWatch Event trigger"
}

variable "description" {
  description = "Trigger description"
}

variable "trigger_type" {
  description = "The type of event trigger (used to derive trigger rules)"
}

variable "frequency_type" {
  description = "A predefined frequency for scheduled triggering (required if `trigger_arn` not specified)"
  default     = null
}

variable "frequency_rate" {
  description = "A rate of scheduled triggering"
  default     = null
}

variable "frequency_cron" {
  description = "A CRON expression defining the trigger schedule"
  default     = null
}

variable "trigger_arn" {
  description = "ARN of the event trigger (required if `frequency` not specified)"
  default     = null
}

variable "trigger_context" {
  description = "Additional contextual value relevant to the event trigger"
  default     = null
}

variable "target_arn" {
  description = "ARN of the CloudWatch Event target"
}

variable "target_name" {
  description = "Function name for Lambda targets (used to configure invocation permissions)"
  default     = null
}

variable "target_role" {
  description = "Name of the IAM role assumed by the target"
}