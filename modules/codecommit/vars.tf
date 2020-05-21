variable "name" {
  description = "Name of the CloudWatch Event trigger"
}

variable "description" {
  description = "Trigger description"
}

variable "trigger_type" {
  description = "The type of event trigger (used to derive trigger rules)"
}

variable "repository_name" {
  description = "Name of the CodeCommit repository"
}

variable "repository_branch" {
  description = "Name of a branch in the repository"
}

variable "target_arn" {
  description = "ARN of the CloudWatch Event target"
}

variable "target_role" {
  description = "Name of the IAM role assumed by the target"
}