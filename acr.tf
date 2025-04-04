resource "azurerm_container_registry" "acr_ec" {
    name = "acr${ var.project }${ var.environment }"
    resource_group_name = azurerm_resource_group.rg.name
    location = var.location
    sku = "Basic"

    admin_enabled = true

    tags = var.tags

}