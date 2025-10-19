####################################################################################
# Jarvis & Environment Variables
####################################################################################

variable "org" {
  type        = string
  description = "Injected by CGE, do not set; Org used to select aws accounts"
}

variable "repo_owner" {
  type        = string
  description = "Injected by CGE, do not set; env.REPO_OWNER from Jarvis"
}

variable "repo_server" {
  type        = string
  description = "Injected by CGE, do not set; env.REPO_SERVER from Jarvis"
}

variable "repo_name" {
  type        = string
  description = "Injected by CGE, do not set; env.REPO_NAME from Jarvis"
}

variable "env" {
  type        = string
  description = "Injected by CGE, do not set; env.PROMOTION_ENV_NAME from Jarvis"
}