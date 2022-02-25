terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.97.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.18.0"
    }
  }

  backend "azurerm" {
    # resource_group_name  = "terraform-storage-rg"
    # storage_account_name = "biktfstatesstorage"
    # container_name       = "tfstatesfile"
    # key                  = "dev.terraform.tfstate"
  }
}

provider "azuread" {
  # Configuration options
}


provider "azurerm" {
  features {

  }
}

resource "random_pet" "aksrandom" {

}