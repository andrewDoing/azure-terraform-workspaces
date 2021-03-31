#Create resource group for web resources
resource "azurerm_resource_group" "env" {
    name        = "${terraform.workspace}-${var.project}-rg"
    location    = var.location
}
