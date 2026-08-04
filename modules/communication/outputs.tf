output "connection_string" {

  value     = azurerm_communication_service.acs.primary_connection_string

  sensitive = true

}