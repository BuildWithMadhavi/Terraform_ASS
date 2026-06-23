variable "name" {
  description = "Storage account name (must be globally unique, lowercase)"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure location"
  type        = string
  default     = "eastus"
}

variable "account_tier" {
  description = "Storage account tier"
  type        = string
  default     = "Standard"
}

variable "replication_type" {
  description = "Storage replication type"
  type        = string
  default     = "LRS"
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
