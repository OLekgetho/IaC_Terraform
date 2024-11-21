locals {
  azurerm_resource_group = "${var.prefix}-${random_integer.name.result}"
}

resource "random_integer" "name" {
  min = 10000
  max = 99999
}

resource "azurerm_resource_group" "terrarg" {
  name     = local.azurerm_resource_group
  location = var.location
}

resource "azurerm_network_security_group" "terransg" {
  name                = "${var.prefix}nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.terrarg.name
}

resource "azurerm_virtual_network" "terravn" {
  name                = "${var.prefix}vn"
  location            = var.location
  resource_group_name = azurerm_resource_group.terrarg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "terravn_subnet" {
  name                 = "${var.prefix}vn-subnet"
  resource_group_name  = azurerm_resource_group.terrarg.name
  virtual_network_name = azurerm_virtual_network.terravn.name
  address_prefixes     = ["10.0.4.0/24"]
}

resource "azurerm_network_security_rule" "terransg_rule" {
  name                        = "Allow-rdp"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  source_address_prefix       = "*"
  destination_port_range      = "3389"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.terrarg.name
  network_security_group_name = azurerm_network_security_group.terransg.name
}

resource "azurerm_public_ip" "terrapublic" {
  name                = "${var.prefix}public"
  resource_group_name = azurerm_resource_group.terrarg.name
  location            = var.location
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}

resource "azurerm_subnet_network_security_group_association" "terra-sga" {
  subnet_id                 = azurerm_subnet.terravn_subnet.id
  network_security_group_id = azurerm_network_security_group.terransg.id
}


resource "azurerm_network_interface" "terra-nic" {
  name                = "${var.prefix}-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.terrarg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.terravn_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.terrapublic.id
  }
}

resource "azurerm_windows_virtual_machine" "terrawin" {
  name                  = "${var.prefix}vm"
  location              = var.location
  resource_group_name   = azurerm_resource_group.terrarg.name
  network_interface_ids = [azurerm_network_interface.terra-nic.id]
  size                  = var.vm_size
  admin_username        = ${{secret.USERNAME}}
  admin_password        = ${{secret.PASSWORD}}

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
