resource "azurerm_service_plan" "sp_ec_fo" {
    name = "sp-fo-${ var.project }-${ var.environment }"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    sku_name = "B1"
    os_type = "Linux"

    tags = var.tags
}

resource "azurerm_linux_web_app" "webapp_ui_ec_fo" {
    name = "ui-${ var.project }-${ var.environment }"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    service_plan_id = azurerm_service_plan.sp_ec_fo.id

    site_config {
        always_on = true
        application_stack {
            docker_registry_url = "https://index.docker.io"
            docker_image_name = "nginx:latest"
        }
    }

    app_settings = {
        WEBSITES_PORT = "80"
    }

    tags = var.tags

}

resource "azurerm_linux_web_app" "webapp_api_ec_fo" {
    name = "api-fo-${ var.project }-${ var.environment }"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    service_plan_id = azurerm_service_plan.sp_ec_fo.id

    site_config {
        always_on = true
        application_stack {
            docker_registry_url = "https://index.docker.io"
            docker_image_name = "nginx:latest"
        }
    }

    app_settings = {
        WEBSITES_PORT = "80"
    }

    tags = var.tags
}

resource "azurerm_static_web_app" "ecommerce_site" {
  name = "static-fo-${ var.project }-${ var.environment }"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_tier            = "Free"
  sku_size            = "Free"

  public_network_access_enabled = true

  app_settings = {}

  tags = var.tags
}
