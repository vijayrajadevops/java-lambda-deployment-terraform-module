module "newrelic_secret" {
  #used to store the new relic credentials , secret values stored via AWS console
  source = "github.com/vc-ccs-tf-components/aws-secretsmanager-secret?ref=v0.3.4"
  providers = {
    aws = aws
  }

  name = "${var.secret_name}-${var.env}"
  recovery_window_in_days = 0
  tags = module.tags.tags

}
