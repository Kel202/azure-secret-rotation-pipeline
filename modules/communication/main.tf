resource "azurerm_communication_service" "acs" {

  name                = var.communication_name
  resource_group_name = var.resource_group_name

  data_location = "Africa"

}