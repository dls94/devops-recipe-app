variable "prefixe" {
  description = "Prefix for resources in AWS"
  default     = "raa"
}

variable "project" {
  description = "Project name for tagging ressources"
  default     = "recipe-app-api"
}

variable "contact" {
  description = "Contact email for tagging ressources"
  default     = "dls@mail.com"
}
