variable "prefix" {
  description = "Name prefix for all resources"
  type        = string
  default     = "tfdemo"
}

variable "location" {
  description = "Azure location"
  type        = string
  default     = "eastus"
}

variable "vnet_address_space" {
  description = "VNet address space"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "vnet_subnet_prefix" {
  description = "VNet subnet prefix"
  type        = string
  default     = "10.0.1.0/24"
}

variable "tenant_id" {
  description = "Azure tenant ID (used by Key Vault)"
  type        = string
}

variable "tags" {
  description = "Tags applied to resources"
  type        = map(string)
  default     = {}
}
