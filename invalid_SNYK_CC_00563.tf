tresource "azurerm_resource_group" "example516d" {
  name     = "example516d-resources"
  location = "West Europe"
}

resource "azurerm_network_security_group" "example516d" {
  name                = "example516d-security-group"
  location            = azurerm_resource_group.example516d.location
  resource_group_name = azurerm_resource_group.example516d.name
}

resource "azurerm_network_ddos_protection_plan" "example516d" {
  name                = "ddospplan1"
  location            = azurerm_resource_group.example516d.location
  resource_group_name = azurerm_resource_group.example516d.name
}

resource "azurerm_virtual_network" "default_denied" {
  name                = "example516d-network"
  location            = azurerm_resource_group.example516d.location
  resource_group_name = azurerm_resource_group.example516d.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.example516d.id
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_virtual_network" "denied" {
  name                = "example516d-network"
  location            = azurerm_resource_group.example516d.location
  resource_group_name = azurerm_resource_group.example516d.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]


  ddos_protection_plan {
    id     = azurerm_network_ddos_protection_plan.example516d.id
    enable = false
  }

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.example516d.id
  }

  tags = {
    environment = "Production"
  }
}
