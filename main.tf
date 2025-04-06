provider "azurerm" {
  features {}  

  subscription_id = "66dee015-ef6c-4cbd-a179-55964159584f"
}

resource "azurerm_resource_group" "example" {
  name     = "terraform-rg"
  location = "East US"
}
