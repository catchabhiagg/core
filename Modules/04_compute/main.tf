
resource "azurerm_network_interface" "ani" {
  for_each = var.linux
  name                = each.value.nicname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

 dynamic  "ip_configuration" {
  for_each = each.value.ip_configuration
  content {
    name                          = ip_configuration.value.name
    subnet_id                     = data.azurerm_subnet.as.id
    private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
  }
    
  }
}

resource "azurerm_linux_virtual_machine" "alvm" {
  for_each = var.linux
  name                = each.value.vmname
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = data.azurerm_key_vault_secret.akvu.value
  admin_password      = data.azurerm_key_vault_secret.akvp.value
  network_interface_ids = [azurerm_network_interface.ani[each.key].id]

  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}