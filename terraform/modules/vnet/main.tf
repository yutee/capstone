resource "azurerm_network_security_group" "nsg" {
  name                = "capstone-${var.random_integer}-NSG"
  location            = var.rg_location
  resource_group_name = var.rg_name
}

resource "azurerm_virtual_network" "vnet" {
  name                = "capstone-${var.random_integer}-VNET"
  location            = var.rg_location
  resource_group_name = var.rg_name
  address_space       = ["11.0.0.0/16"]
  dns_servers         = ["11.0.0.4", "10.0.0.5"]

  tags = {
    environment = "Capstone"
  }
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["11.0.1.0/24"]
}

resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["11.0.2.0/24"]
}