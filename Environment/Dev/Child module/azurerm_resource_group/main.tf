resource "azurerm_resource_group" "veenu_rg" {
  for_each   = var.rg
  name       = each.value.name
  location   = each.value.location
  managed_by = each.value.managed_by
}