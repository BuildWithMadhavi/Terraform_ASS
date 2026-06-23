variable "name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure location"
  type        = string
  default     = "eastus"
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
