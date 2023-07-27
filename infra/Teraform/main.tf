terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.49.0"
    }
  }
}

provider "azurerm" {
  features {}
}

output "subscription_id" {
  value = data.azurerm_subscription.current.subscription_id
}

output "client_id" {
  value = data.azurerm_client_config.current.client_id
}

resource "azurerm_resource_group" "challenge-rg" {
  name     = "${var.name}-rg"
  location = var.location
}

resource "azurerm_virtual_network" "challenge-vnet" {
  name                = var.name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.challenge-rg.location
  resource_group_name = azurerm_resource_group.challenge-rg.name
}

resource "azurerm_subnet" "challenge-subnet" {
  name                 = "${var.name}-subnet"
  resource_group_name  = azurerm_resource_group.challenge-rg.name
  virtual_network_name = azurerm_virtual_network.challenge-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_cognitive_account" "cognitive" {
  name                = "${var.name}-cognitive-account"
  location            = azurerm_resource_group.challenge-rg.location
  resource_group_name = azurerm_resource_group.challenge-rg.name
  sku                 = var.sku
  kind                = var.kind
}

resource "azurerm_private_endpoint" "cognitive-private-endpoint" {
  name                = "${var.name}-cognitive-private-endpoint"
  location            = azurerm_resource_group.challenge-rg.location
  resource_group_name = azurerm_resource_group.challenge-rg.name
  subnet_id           = azurerm_subnet.challenge-subnet.id

  private_service_connection {
    name                           = "cognitive-private-service-connection"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_cognitive_account.cognitive.id
    subresource_names              = ["textanalytics"]
  }

  private_dns_zone_group {
    name            = "cognitive-private-dns-zone-group"
    private_dns_zone_id = "/subscriptions/your_subscription_id/resourceGroups/your_vnet_resource_group/providers/Microsoft.Network/privateDnsZones/privatelink.azure.com"
  }
}
