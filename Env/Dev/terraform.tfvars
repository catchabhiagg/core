rg = {
  rg1 = {
    name     = "rg-core-01"
    location = "East US"
  }
}

network = {
  network1 = {
    name                = "vnetcore"
    location            = "southafricanorth"
    resource_group_name = "rg-core-01"
    subnet = {
      subnet1 = {
        name             = "subcore"
        address_prefixes = ["10.0.1.0/24"]
      }
      subnet2 = {
        name             = "AzureBastionSubnet"
        address_prefixes = ["10.0.2.0/26"]
      }
    }
  }
}

ip = {
  ip1 = {
    name                = "pipcore"
    resource_group_name = "rg-core-01"
    location            = "southafricanorth"
  }
}

linux = {
  linux1 = {
    vmname              = "corevm"
    resource_group_name = "rg-core-01"
    location            = "southafricanorth"
    size                = "Standard_D2ls_v5"
    // zone                = "1"
    nicname             = "corenic"
    ip_configuration = {
      ip_configuration1 = {
        name                          = "coreipconfiguration"
        private_ip_address_allocation = "Dynamic"
      }
    }
  }
}

bastion = {
  bastion1 = {
    bastion_name        = "corebastion"
    location            = "southafricanorth"
    resource_group_name = "rg-core-01"
    ip_configuration = {
      ip_configuration1 = {
        ip_name = "coreipconfiguration1"
      }

    }
  }
}

// keyvault = {
//   core = {
//     name                = "corekvsecure"
//     location            = "East US"
//     resource_group_name = "infra_core"
//   }
// }


sqlserver = {
  sqlserver1 = {
    name                         = "coresqlserver"
    resource_group_name          = "rg-core-01"
    location                     = "southafricanorth"
    administrator_login          = "coreadmin"
    administrator_login_password = "core@admin123"
  }
}

sql_database = {
  sql_database1 = {
    name         = "coresqldatabase"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
  }
}