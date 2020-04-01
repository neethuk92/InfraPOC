provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "infrarespoc"
  location = "northeurope"
}

# NOTE: the Name used for Redis needs to be globally unique
resource "azurerm_redis_cache" "example" {
  name                = "sampleredisserver"
  location            = "northeurope"
  resource_group_name = "${azurerm_resource_group.example.name}"
  capacity            = 2
  family              = "C"
  sku_name            = "Standard"
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"
  redis_configuration {}
}
