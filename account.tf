module "aws_accounts" {
  source = "github.com/vc-ccs-tf-components/data-aws-accounts?ref=v0.1.6"
  providers = {
    aws = aws
  }

  org = var.org
}

locals {
  current_account_id = module.aws_accounts.current_account_id
}
