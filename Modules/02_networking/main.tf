resource "azurerm_virtual_network" "net" {
  for_each = var.network
  name                = each.value.name
  address_space       = ["10.0.0.0/16"]
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

dynamic "subnet" {
  for_each = each.value.subnet
  content{
  name                 = subnet.value.name
  address_prefixes     = subnet.value.address_prefixes
  }
}
}

