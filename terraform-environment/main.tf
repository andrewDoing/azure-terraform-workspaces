locals {
    workspace = "${terraform.workspace}"
}

#Create resource group for web resources
resource "azurerm_resource_group" "env" {
    name        = "${local.workspace}-andoing-rg"
    location    = var.location
}
