resource "azurerm_resource_group" "main" {

  name     = var.resource_group_name

  location = var.location

}

resource "random_string" "suffix" {

  length  = 5

  special = false

  upper   = false

}

resource "azurerm_storage_account" "storage" {

  name                     = "stsecret${random_string.suffix.result}"

  resource_group_name      = azurerm_resource_group.main.name

  location                 = azurerm_resource_group.main.location

  account_tier             = "Standard"

  account_replication_type = "LRS"

}


data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {

  name                = "kv-secret-${random_string.suffix.result}"

  location            = azurerm_resource_group.main.location

  resource_group_name = azurerm_resource_group.main.name

  tenant_id           = data.azurerm_client_config.current.tenant_id

  sku_name            = "standard"

  enable_rbac_authorization = true

  soft_delete_retention_days = 7

  purge_protection_enabled = false

}


resource "azurerm_log_analytics_workspace" "logs" {

  name                = "law-secret-${random_string.suffix.result}"

  location            = azurerm_resource_group.main.location

  resource_group_name = azurerm_resource_group.main.name

  sku                 = "PerGB2018"

  retention_in_days   = 30

}

resource "azurerm_application_insights" "appinsights" {

  name                = "appi-secret-${random_string.suffix.result}"

  location            = azurerm_resource_group.main.location

  resource_group_name = azurerm_resource_group.main.name

  workspace_id        = azurerm_log_analytics_workspace.logs.id

  application_type    = "web"

}

resource "azurerm_key_vault_secret" "database_password" {

  name = "DatabasePassword"

  value = "ChangeMe123!"

  key_vault_id = azurerm_key_vault.kv.id

  expiration_date = "2026-08-15T00:00:00Z"

}