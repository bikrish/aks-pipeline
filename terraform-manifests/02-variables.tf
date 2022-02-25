variable "location" {
  default     = "eastus2"
  description = "All resources will be created in the RG"
  type        = string
}

variable "resource_group_name" {
  default     = "terraform-aks"
  type        = string
  description = "name of aks"
}

variable "environment" {
  # default     = "prod"
  type        = string
  description = "defines the environment"
}

variable "ssh_public_key" {
  # default     = "/home/bikrish/.ssh/aks-prod-sshkeys/aksprodsshkey.pub"
  description = "SSH Public key"
}

variable "windows_admin_username" {
  type        = string
  default     = "azureuser"
  description = "Windows admin username"
}

variable "windows_admin_password" {
  type        = string
  default     = "JOYgrace!234567"
  description = "Windows admin password"
}

