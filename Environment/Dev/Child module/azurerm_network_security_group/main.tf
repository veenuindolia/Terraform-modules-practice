resource "azurerm_network_security_group" "veenu_nsgs" {
  for_each            = var.nsgs
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  security_rule {
    name                       = each.value.security.name
    priority                   = each.value.security.priority
    direction                  = each.value.security.direction
    access                     = each.value.security.access
    protocol                   = each.value.security.protocol
    source_port_range          = each.value.security.source_port_range
    destination_port_range     = each.value.security.destination_port_range
    source_address_prefix      = each.value.security.source_address_prefix
    destination_address_prefix = each.value.security.destination_address_prefix
  }
}