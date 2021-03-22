variable "name" {
  description = "Name of the CloudWatch Event trigger"
}

variable "description" {
  description = "Trigger description"
}

variable "frequency_type" {
  description = "A predefined frequency for scheduled triggering (required if `trigger_arn` not specified)"
  default     = "hourly_on_weekdays"
}

variable "frequency_rate" {
  description = "A rate of scheduled triggering"
  default     = null
}

variable "frequency_cron" {
  description = "A CRON expression defining the trigger schedule"
  default     = null
}

variable "event_source" {
  description = "Source of events for this rule"
  default     = null
}

variable "event_types" {
  description = "A list of event types to monitor from the event source"
  type        = list(string)
  default     = []
}

variable "source_arns" {
  description = "A list of ARNs used to filter the monitored source"
  default     = []
}

variable "event_detail" {
  description = "A map of configuration data specific to the event type"
  type        = map(any)
  default     = {}
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

variable "tags" {
  description = "Tags for the event rule"
  type        = map(any)
  default     = {}
}

locals {
  frequency = {
    // trigger at midnight (UTC) on weekdays..
    weekdays = "cron(0 0 ? * MON-FRI *)"

    // trigger every hour on weekdays..
    hourly_on_weekdays = "cron(0 * ? * MON-FRI *)"

    secondly = "rate(1 second)"
    minutely = "rate(1 minute)"
    hourly   = "rate(1 hour)"
    daily    = "rate(1 day)"
    weekly   = "rate(1 week)"
    monthly  = "rate(1 month)"
    yearly   = "rate(1 year)"

    cron = format("cron(%s)", var.frequency_cron)
    rate = format("rate(%s)", var.frequency_rate)
  }
}
