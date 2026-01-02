resource "azurerm_mssql_database" "azsqldata" {
  for_each = var.sql_database
  name         = each.value.name
  server_id    = data.azurerm_mssql_server.mssql.id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}
