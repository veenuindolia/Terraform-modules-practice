resource "azurerm_public_ip" "bastion_pip" {
  name                = "veenu-bastion-pip"
  location            = "centralindia"
  resource_group_name = "veenu-rg1"

  allocation_method = "Static"
  sku               = "Standard"
}