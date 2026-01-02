module "rg" {
  source = "../../Modules/01_resourcegroup"
  rg     = var.rg
}

module "vnetsubnet" {
  depends_on = [module.rg]
  source     = "../../Modules/02_networking"
  network    = var.network
}

module "pubip" {
  depends_on = [module.vnetsubnet]
  source     = "../../Modules/03_public_ip"
  ip         = var.ip
}

module "vm" {
  depends_on = [module.pubip]
  source     = "../../Modules/04_compute"
  linux      = var.linux
}

module "bastion" {
  depends_on = [module.vm]
  source     = "../../Modules/05_bastion"
  bastion    = var.bastion
}

module "server" {
  depends_on = [module.bastion]
  source     = "../../Modules/06_sql_server"
  sqlserver  = var.sqlserver
}

module "database" {
  depends_on   = [module.server]
  source       = "../../Modules/07_sql_database"
  sql_database = var.sql_database
}
