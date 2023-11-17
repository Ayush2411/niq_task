provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "staging" {
  name     = "staging-resource-group"
  location = "East US"
}

resource "azurerm_virtual_network" "staging_network" {
  name                = "staging-network"
  resource_group_name = azurerm_resource_group.staging.name
  location            = azurerm_resource_group.staging.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "staging_subnet" {
  name                 = "staging-subnet"
  resource_group_name  = azurerm_resource_group.staging.name
  virtual_network_name = azurerm_virtual_network.staging_network.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_linux_virtual_machine" "staging_vm" {
  name                = "staging-vm"
  resource_group_name = azurerm_resource_group.staging.name
  location            = azurerm_resource_group.staging.location
  size                = "Standard_DS1_v2"
  admin_username      = "adminuser"
  admin_password      = "Password1234!"

  network_interface_ids = [azurerm_network_interface.staging_nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}

resource "azurerm_network_interface" "staging_nic" {
  name                = "staging-nic"
  resource_group_name = azurerm_resource_group.staging.name
  location            = azurerm_resource_group.staging.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.staging_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}