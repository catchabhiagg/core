variable "bastion" {
  type = map(object({
    bastion_name               = string
  location            = string
  resource_group_name = string
  ip_configuration = map(object({
    ip_name                 = string
  }))
  }))
}