data "azurerm_subnet" "absunet" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "vnetcore"
  resource_group_name  = "rg-core-01"
}

data "azurerm_public_ip" "dataaip" {
  name                = "pipcore"
  resource_group_name = "rg-core-01"
}