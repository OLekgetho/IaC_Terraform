terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.10.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "43c517cc-4ab2-44b4-b218-97d7419c1b2d"

}