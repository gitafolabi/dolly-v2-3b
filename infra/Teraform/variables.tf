variable name {
  type        = string
  description = "Name for the Azure Cognitive Service Resource "
  default     = "challenge-resources"
}

variable "location" {
  type          = string
  description   = "Resource Location"
  default       = "West Europe"
}

variable "kind" {
  type          = string
  description = "The kind of Azure Cognitive Service Resource "
  default       = "TextAnalytics"
}

variable "sku" {
  type          = string
  description   = "SKU of Azure Cognitive Service Resource"
  default       = "S0"
}