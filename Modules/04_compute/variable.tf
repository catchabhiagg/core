variable "linux" {
  type = map(object({
    vmname                = string
  resource_group_name = string
  location            = string
  size  = string
  nicname = string
  ip_configuration = map(object({
    name = string
    private_ip_address_allocation = string
  }))
  }))
}