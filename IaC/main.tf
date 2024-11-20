terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.117.0"
    }
  }

  backend "azurerm" {}
}

provider "azurerm" {
    features {}
}

data "azurerm_client_config" "current" {
  
}