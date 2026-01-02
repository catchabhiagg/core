data "azurerm_subnet" "as" {
  name                 = "subcore"
  virtual_network_name = "vnetcore"
  resource_group_name  = "rg-core-01"
}

data "azurerm_key_vault" "akv" {                #this we are creating directly to azure
  name                = "corekvsecure"
  resource_group_name = "infra_core"             #also this resource group we are creating directly to azure
}

data "azurerm_key_vault_secret" "akvu" {
  name         = "username"
  key_vault_id = data.azurerm_key_vault.akv.id
}
data "azurerm_key_vault_secret" "akvp" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.akv.id
}