module "tags" {
  source = "github.com/vc-ccs-tf-components/data-aws-tags?ref=v3.0.133"

  env         = var.env
  org         = var.org
  repo_name   = var.repo_name
  repo_owner  = var.repo_owner
  repo_server = var.repo_server

  cmdb_apm_number = var.cmdb_apm_number
  application     = var.application
  platform        = var.platform
  service         = var.service

  business_unit         = var.business_unit
  bu_division           = var.bu_division
  sbu_division          = var.sbu_division
  financial_owner_name  = var.financial_owner_name
  financial_owner_email = var.financial_owner_email
  tech_owner_name       = var.tech_owner_name
  tech_owner_email      = var.tech_owner_email
  tech_team_owner       = var.tech_team_owner

  schedule                = var.schedule
  retention               = var.retention
  resource_lease_end_date = var.resource_lease_end_date
  migration_tags          = var.migration_tags
  tags                    = var.tags
}