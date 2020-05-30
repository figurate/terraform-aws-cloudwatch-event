module "event_trigger" {
  source = "../.."

  description    = var.description
  name           = var.name
  target_arn     = var.target_arn
  target_name    = var.target_name
  target_role    = var.target_role
  trigger_type   = "scheduled"
  frequency_type = var.frequency_type
  frequency_cron = var.frequency_cron
  frequency_rate = var.frequency_rate
}
