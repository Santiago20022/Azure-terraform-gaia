provider "azurerm" {
  features {}  

  subscription_id = "66dee015-ef6c-4cbd-a179-55964159584f"
}

# Create the resource group
resource "azurerm_resource_group" "rg" {
  name     = "my-example-rg"
  location = "eastus"
}

# Create the Linux App Service Plan
resource "azurerm_service_plan" "appserviceplan" {
  name                = "my-example-serviceplan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "B1"
}

# Create the web app, pass in the App Service Plan ID
resource "azurerm_linux_web_app" "webapp" {
  name                  = "my-example-webapp"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  service_plan_id       = azurerm_service_plan.appserviceplan.id
  depends_on            = [azurerm_service_plan.appserviceplan]
  https_only            = true
  site_config { 
    minimum_tls_version = "1.2"
    application_stack {
      node_version = "22-lts"
    }
  }
}

#  Deploy code from a public GitHub repo
resource "azurerm_app_service_source_control" "sourcecontrol" {
  app_id             = azurerm_linux_web_app.webapp.id
  repo_url           = "https://github.com/Santiago20022/Azure-terraform-gaia"
  branch             = "main"
  use_manual_integration = true
  use_mercurial      = false
}
