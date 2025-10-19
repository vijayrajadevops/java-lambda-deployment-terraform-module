####################################################################################
# Tag Variables
####################################################################################

variable "service" {
  type    = string
  default = "NOSERVICE"
}

variable "application" {
  type    = string
  default = "NOAPPLICATION"
}

variable "business_unit" {
  description = "Business-Unit, leave empty to find by bu_division"
  type        = string
  default     = null
}

variable "bu_division" {
  description = "Must match one of the predefined values from locals_business_units.tf"
  type        = string
}

variable "sbu_division" {
  type        = string
  description = "Sub-business Unit Division, leave empty if not needed"
  default     = null
}

variable "platform" {
  type    = string
  default = "NOPLATFORM"
}

variable "retention" {
  type        = number
  description = "The number of days to retain volume snapshot backups (default is 30 days)"
  default     = null
}

variable "schedule" {
  description = "Schedule for when resources should be on"
  default     = null
}

variable "financial_owner_name" {
  type        = string
  description = "Owner first name and last name. Will be used to identify the owner of the environment."
}

variable "financial_owner_email" {
  type        = string
  description = "Email address of the owner/requestor"
}

variable "tech_team_owner" {
  type        = string
  description = "Application team that uses this Virtual Machine"
}

variable "tech_owner_name" {
  type        = string
  description = "Names of two people who owns this Virtual Machine"
}

variable "tech_owner_email" {
  type        = string
  description = "Email address will be used for communication to the App team when VM needs to be terminated or any maintenance activity that AWS needs to perform on the VM"
}

variable "excludepatchmanagement" {
  type    = bool
  default = false
}

variable "migration_tags" {
  type = object({
    migration = string
    origin    = string
    wave      = string
  })
  description = "This tag will be used to identify if we are migrating the workloads from onprem to cloud. Use 'yes' or 'no' value only."
  default = {
    "migration" = "no",
    "origin"    = "",
    "wave"      = ""
  }
}

variable "resource_lease_end_date" {
  type        = string
  description = "Automatic shutting down and termination on the end date"
  default     = null
}

variable "cmdb_apm_number" {
  description = "The CMDB APM number"
  type        = string
}

variable "tags" {
  default = {}
}
