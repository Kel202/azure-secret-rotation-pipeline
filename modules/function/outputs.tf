output "function_identity" {
  value = azurerm_linux_function_app.function.identity[0].principal_id
}

output "function_name" {
  value = azurerm_linux_function_app.function.name
}