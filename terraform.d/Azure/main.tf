# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "=3.0.0"
        }
    }
}

# Configure the Microsoft Azure Provider
# --------------------------------------
# Used Tutorials:   https://docs.microsoft.com/en-us/azure/developer/terraform/authenticate-to-azure?tabs=bash
#                   https://www.phillipsj.net/posts/cloud-init-with-terraform/
####################################################################################################################
provider "azurerm" {
    features {}

    subscription_id = "be8ba630-d939-495c-bb2d-5660abfad06e"
    tenant_id       = "ce79b4ce-a54b-4393-807f-25df142a806b"
    client_id       = "bdda9419-4119-424c-8eea-a78f8a12d4f8"
    client_secret   = "tZOm9jNYIHs5xnNE~5lF54FTg3BOtkkP7Z"
}

module "vm-db" {
    source        = "./vm-db"
    v_rg_name     = azurerm_resource_group.TerraformTest.name
    v_rg_location = azurerm_resource_group.TerraformTest.location
    v_nic         = azurerm_network_interface.vm2nic.id
}

module "vm-web" {
    source        = "./vm-web"
    v_rg_name     = azurerm_resource_group.TerraformTest.name
    v_rg_location = azurerm_resource_group.TerraformTest.location
    v_nic         = azurerm_network_interface.vm1nic.id
}

# Create a resource group
resource "azurerm_resource_group" "TerraformTest" {
    name     = "terraform-test"
    location = "East US"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "TerraformNetwork" {
    name                = "terraform-network"
    resource_group_name = azurerm_resource_group.TerraformTest.name
    location            = azurerm_resource_group.TerraformTest.location
    address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "snet" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.TerraformTest.name
  virtual_network_name = azurerm_virtual_network.TerraformNetwork.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "vm1nic" {
  name                = "vm1nic"
  location            = azurerm_resource_group.TerraformTest.location
  resource_group_name = azurerm_resource_group.TerraformTest.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.snet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm1pip.id
  }
}

resource "azurerm_network_interface" "vm2nic" {
  name                = "vm2nic"
  location            = azurerm_resource_group.TerraformTest.location
  resource_group_name = azurerm_resource_group.TerraformTest.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.snet.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id          = azurerm_public_ip.vm1pip.id
  }
}

resource "azurerm_public_ip" "vm1pip" {
  name                = "vm1pip"
  resource_group_name = azurerm_resource_group.TerraformTest.name
  location            = azurerm_resource_group.TerraformTest.location
  allocation_method   = "Dynamic"
}
