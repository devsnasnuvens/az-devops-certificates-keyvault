variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "key_vault_name" {
  type = string
}

variable "key_vault_sku" {
  type = string
}

variable "certificate_name" {
  type = string
}

variable "certificate_password" {
  type = string
  sensitive = true
}

variable "certificate_path" {
  type = string
}