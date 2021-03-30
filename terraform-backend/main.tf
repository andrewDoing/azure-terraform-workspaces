resource "azurerm_resource_group" "backend" {
    name        = "andoing-backend-rg"
    location    = var.location
}

resource "azurerm_storage_account" "backend" {
  name                = "backendstateandoing"
  resource_group_name = azurerm_resource_group.backend.name
  location            = azurerm_resource_group.backend.location

  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate-env-workspaces"
  storage_account_name  = azurerm_storage_account.backend.name
  container_access_type = "private"
}