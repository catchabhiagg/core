variable "bastion" {
  type = map(object({
    bastion_name        = string
    location            = string
    resource_group_name = string
    ip_configuration = map(object({
      ip_name = string
    }))
  }))
}

variable "linux" {
  type = map(object({
    vmname              = string
    resource_group_name = string
    location            = string
    size                = string
    nicname             = string
    ip_configuration = map(object({
      name                          = string
      private_ip_address_allocation = string
    }))
  }))
}

variable "ip" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
  }))
}

variable "network" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    subnet = map(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}

variable "rg" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "keyvault" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}

variable "sqlserver" {
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    administrator_login          = string
    administrator_login_password = string
  }))
}

variable "sql_database" {
  type = map(object({
    name         = string
    collation    = string
    license_type = string
  }))
}