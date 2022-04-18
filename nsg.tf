provider "azurerm" {
  version = "=3.0.0"

  subscription_id = "12a29f7f-26f9-4789-8a33-b81bf7285866"
  client_id       = "d508ed88-14f4-497b-9df0-224572405bc1"
  client_secret   = "ni97Q~F9m8B6139ZPFQgA13hzuKbjwhOzFCU0"
  tenant_id       = "8c637a63-7f95-4083-87de-51588cbfcf0e"
  features {}

}

data "azurerm_resource_group" "rg" {
name="newrg"
}

resource "azurerm_network_security_group" "example"{
  name                = "nsg1"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "dev"
  }
}