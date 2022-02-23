terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}

  subscription_id = "43859f48-8b35-47a9-9bfc-84b2b43e8228" # VS
}

provider "azurerm" {
  alias = "hub"
  features {}

  subscription_id = "7193ebab-304b-4b0b-a29d-6fe7b472f608" # Partner
}
