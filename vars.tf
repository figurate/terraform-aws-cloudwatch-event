variable "name" {
  description = "Name of the CloudWatch Event trigger"
}

variable "description" {
  description = "Trigger description"
}

variable "trigger_type" {
  description = "The type of event trigger (used to derive trigger rules)"
}

variable "trigger_arn" {
  description = "ARN of the event trigger"
}

variable "trigger_context" {
  description = "Additional contextual value relevant to the event trigger"
}

variable "target_arn" {
  description = "ARN of the CloudWatch Event target"
}

variable "target_role" {
  description = "Name of the IAM role assumed by the target"
}