data "template_file" "trigger_codecommit" {
  template = file("${path.module}/templates/codecommit.json")
  vars = {
    RepositoryArn    = var.trigger_arn
    RepositoryBranch = var.trigger_context
  }
}

locals {
  triggers = {
    codecommit = data.template_file.trigger_codecommit.rendered
  }

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
