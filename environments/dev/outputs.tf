output "resource_group" {
  value = azurerm_resource_group.main.name
}

output "keyvault_name" {
  value = azurerm_key_vault.kv.name
}

output "storage_account" {
  value = azurerm_storage_account.storage.name
}