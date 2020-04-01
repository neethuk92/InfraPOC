provider "azurerm" {
  subscription_id = "ebe05484-9894-423e-a6bd-a1ccb1aa6180"
  client_id       = "2fcf3a5f-3f70-4570-9601-e7dcb5031c10"
  client_secret   = "dMEm9=co0MMJY9Cr4bTIGBNgVxn]cG::"
  tenant_id       ="87ebd5e1-02c3-4bb9-8e8b-65ef3bc9682d"
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
