terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.57.0"
    }

  }
  backend "azurerm" {
    resource_group_name  = "rg-core"
    storage_account_name = "corestoragetfstate"
    container_name       = "statefile"
    key                  = "tfstate"
  }
}
provider "azurerm" {
  features {
  }
     subscription_id = "acd9510d-7e29-433d-8504-d10d34dba654"
  
}

