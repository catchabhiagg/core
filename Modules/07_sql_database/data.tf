data "azurerm_mssql_server" "mssql" {
  name                = "coresqlserver"
  resource_group_name = "rg-core-01"
}


