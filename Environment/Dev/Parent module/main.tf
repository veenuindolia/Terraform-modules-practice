
module "rg" {
  source = "../Child module/azurerm_resource_group"
  rgs    = var.rg
}

module "vnet" {
  depends_on = [module.rg]
  source     = "../Child module/azurerm_virtual_network"
  vnets      = var.vnets
}

module "subnet" {
  depends_on = [module.vnet]
  source     = "../Child module/azurerm_subnet"
  subnets    = var.subnets
}

module "public_ip" {
  depends_on = [module.rg]
  source     = "../Child module/azurerm_public ip"

}

module "bastion" {
  depends_on = [module.rg, module.public_ip, module.subnet]
  source     = "../Child module/azurerm_bastion"
  bastions   = var.bastions
}

module "network_security_group" {
  depends_on = [module.rg]
  source     = "../Child module/azurerm_network_security_group"
  nsgs       = var.nsgs
}

module "network_interface" {
  depends_on = [module.rg, module.subnet]
  source     = "../Child module/azurerm_network_interface_card"
  nics       = var.nics
}

module "virtual_machine" {
  depends_on = [module.rg, module.network_security_group, module.network_interface, module.subnet, module.association]
  source     = "../Child module/azurerm_virtual_machine"
  vms        = var.vms
}

module "association" {
  depends_on      = [module.network_security_group, module.subnet]
  source          = "../Child module/azurerm_network_association"
  nsgassociations = var.nsgassociations
}

  