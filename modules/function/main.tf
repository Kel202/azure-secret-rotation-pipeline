resource "azurerm_service_plan" "function_plan" {
  name                = "asp-secret-rotation"
  resource_group_name = var.resource_group_name
  location            = var.location

  os_type  = "Linux"
  sku_name = "Y1"
}

resource "azurerm_linux_function_app" "function" {

  name                = "func-secret-${var.random_suffix}"

  resource_group_name = var.resource_group_name

  location            = var.location

  service_plan_id     = azurerm_service_plan.function_plan.id

  storage_account_name       = var.storage_account_name

  storage_account_access_key = var.storage_account_key

  https_only = true

  identity {
    type = "SystemAssigned"
  }

  site_config {
    application_stack {
      python_version = "3.11"
    }
  }

}