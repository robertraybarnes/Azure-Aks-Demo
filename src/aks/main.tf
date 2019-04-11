provider "azurerm" {
  //run az login or enavle service principle details
}

terraform {
  backend "azurerm" {
    resource_group_name  = "terraformsa"
    storage_account_name = "devopsrobtfaks"
    container_name       = "tfstate"
    key                  = "aks-demo-environment.tfstate"
    environment          = "public"
  }
}
