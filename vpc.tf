module "aws_vpc" {
  # Used to pull the VPC id of the main vpc in the account/region you are deploying to, also pulls the subnets for that vpc
  source = "github.com/vc-ccs-tf-components/data-aws-vpc?ref=v0.1.2"

  providers = {
    aws = aws
  }

  org = var.org
}