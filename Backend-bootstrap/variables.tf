variable "rg_name" {
  description = "Resource group name for backend storage"
  type        = string
  default     = "tf-backend-rg"
}

variable "location" {
  description = "Azure location"
  type        = string
  default     = "eastus"
}

variable "storage_account_name" {
  description = "Storage account name for remote state (must be globally unique, lowercase)"
  type        = string
}

variable "container_name" {
  description = "Blob container name for tfstate"
  type        = string
  default     = "tfstate"
}
