rg = {
  rg1 = {
    name       = "veenu-rg1"
    location   = "centralindia"
    managed_by = "terraform"

  }

  rg2 = {
    name       = "veenu-rg2"
    location   = "centralindia"
    managed_by = "terraform"

  }
  rg3 = {
    name       = "veenu-rg3"
    location   = "centralindia"
    managed_by = "terraform"

  }
}

vnets = {
  vnet1 = {
    name                = "veenu-vnet1"
    location            = "centralindia"
    resource_group_name = "veenu-rg1"
    address_space       = ["10.10.0.0/16"]
  }

}

subnets = {
  subnet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "veenu-rg1"
    virtual_network_name = "veenu-vnet1"
    address_prefixes     = ["10.10.1.0/24"]
  }
  subnet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "veenu-rg1"
    virtual_network_name = "veenu-vnet1"
    address_prefixes     = ["10.10.2.0/24"]
  }

  subnet3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "veenu-rg1"
    virtual_network_name = "veenu-vnet1"
    address_prefixes     = ["10.10.10.0/26"]
  }
}

bastions = {
  bastion1 = {
    name                = "veenu-bastion"
    location            = "centralindia"
    resource_group_name = "veenu-rg1"


    ip_configuration = {
      name                 = "configuration"
      subnet_id            = "/subscriptions/65879a1d-8a71-47e6-af69-9f811ecad89e/resourceGroups/veenu-rg1/providers/Microsoft.Network/virtualNetworks/veenu-vnet1/subnets/AzureBastionSubnet"
      public_ip_address_id = "/subscriptions/65879a1d-8a71-47e6-af69-9f811ecad89e/resourceGroups/veenu-rg1/providers/Microsoft.Network/publicIPAddresses/veenu-bastion-pip"
    }

  }
}

nsgs = {
  nsg1 = {
    name                = "frontend-nsg"
    location            = "centralindia"
    resource_group_name = "veenu-rg1"

    security = {
      name                       = "frontend-security"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }

  nsg2 = {
    name                = "backend-nsg"
    location            = "centralindia"
    resource_group_name = "veenu-rg1"

    security = {
      name                       = "backend-security"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }

  }

}

nics = {
  nic1 = {
    name                = "veenu-nic1"
    location            = "centralindia"
    resource_group_name = "veenu-rg1"

    ip_configuration = {
      name                          = "frontendip"
      subnet_id                     = "/subscriptions/65879a1d-8a71-47e6-af69-9f811ecad89e/resourceGroups/veenu-rg1/providers/Microsoft.Network/virtualNetworks/veenu-vnet1/subnets/frontend-subnet"
      private_ip_address_allocation = "Dynamic"
    }
  }
  nic2 = {
    name                = "veenu-nic2"
    location            = "centralindia"
    resource_group_name = "veenu-rg1"

    ip_configuration = {
      name                          = "backendip"
      subnet_id                     = "/subscriptions/65879a1d-8a71-47e6-af69-9f811ecad89e/resourceGroups/veenu-rg1/providers/Microsoft.Network/virtualNetworks/veenu-vnet1/subnets/backend-subnet"
      private_ip_address_allocation = "Dynamic"
    }
  }

}

nsgassociations = {
  nsgassociation1 = {
    subnet_id                 = "/subscriptions/65879a1d-8a71-47e6-af69-9f811ecad89e/resourceGroups/veenu-rg1/providers/Microsoft.Network/virtualNetworks/veenu-vnet1/subnets/frontend-subnet"
    network_security_group_id = "/subscriptions/65879a1d-8a71-47e6-af69-9f811ecad89e/resourceGroups/veenu-rg1/providers/Microsoft.Network/networkSecurityGroups/frontend-nsg"
  }
  nsgassociation2 = {
    subnet_id                 = "/subscriptions/65879a1d-8a71-47e6-af69-9f811ecad89e/resourceGroups/veenu-rg1/providers/Microsoft.Network/virtualNetworks/veenu-vnet1/subnets/backend-subnet"
    network_security_group_id = "/subscriptions/65879a1d-8a71-47e6-af69-9f811ecad89e/resourceGroups/veenu-rg1/providers/Microsoft.Network/networkSecurityGroups/backend-nsg"
  }

}

vms = {
  # vm1 = {
  #   name                  = "frontend-vm"
  #   location              = "centralindia"
  #   resource_group_name   = "veenu-rg1"
  #   network_interface_ids = ["/subscriptions/65879a1d-8a71-47e6-af69-9f811ecad89e/resourceGroups/veenu-rg1/providers/Microsoft.Network/networkInterfaces/veenu-nic1"]
  #   vm_size               = "Standard_D2s_v3"
  #   admin_username        = "windowsvm"
  #   admin_password        = "windowsvm@12345"

  #   storage_image_reference = {
  #     publisher = "MicrosoftWindowsServer"
  #     offer     = "WindowsServer"
  #     sku       = "2025-datacenter"
  #     version   = "latest"
  #   }
  #   storage_os_disk = {
  #     name              = "myosdisk1"
  #     create_option     = "FromImage"
  #     caching           = "ReadWrite"
  #     managed_disk_type = "Standard_LRS"
  #     disk_size_gb      = 127
  #   }
  #   os_profile = {
  #     computer_name  = "veenucomputer"
  #     admin_username = "windowsvm"
  #     admin_password = "windowsvm@12345"
  #   }

  # }

    vm1 = {
      name                  = "frontend-vm"
      location              = "centralindia"
      resource_group_name   = "veenu-rg1"
      network_interface_ids = ["/subscriptions/65879a1d-8a71-47e6-af69-9f811ecad89e/resourceGroups/veenu-rg1/providers/Microsoft.Network/networkInterfaces/veenu-nic1"]
      size               = "Standard_D2s_v3"
      admin_username        = "linuxvm"
      admin_password        = "linuxvm@12345"
      disable_password_authentication = false

      source_image_reference = {
        publisher = "Canonical"
        offer     = "ubuntu-24_04-lts"
        sku       = "server"
        version   = "latest"
      }
     os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    
        }

    }




