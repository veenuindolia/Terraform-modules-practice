terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.75.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "veenu-rg"
    storage_account_name = "veenustorage"
    container_name       = "dev-container"
    key                  = "dev.tfstate"

  }
}

provider "azurerm" {
  features {}
}