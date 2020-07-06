# ---------------------------------------------------------------------------------------------------------------------
# CREATE A RESOURCE GROUP
# ---------------------------------------------------------------------------------------------------------------------

resource "azurerm_resource_group" "myterraformgroup" {
    name     = "trinity-resource-group"
    location = "eastus"

    tags = {
        environment = "Velocity Demo"
    }
}


# ---------------------------------------------------------------------------------------------------------------------
# CREATE A VIRTUAL NETWORK
# ---------------------------------------------------------------------------------------------------------------------

resource "azurerm_virtual_network" "myterraformnetwork" {
    name                = "trinity-virtual-network"
    address_space       = ["10.0.0.0/16"]
    location            = "eastus"
    resource_group_name = azurerm_resource_group.myterraformgroup.name

    tags = {
        environment = "Velocity Demo"
    }
}

resource "azurerm_subnet" "myterraformsubnet" {
    name                 = "trinity-subnet"
    resource_group_name  = azurerm_resource_group.myterraformgroup.name
    virtual_network_name = azurerm_virtual_network.myterraformnetwork.name
    address_prefixes       = ["10.0.2.0/24"]
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A PUBLIC IP ADDRESS
# ---------------------------------------------------------------------------------------------------------------------

resource "azurerm_public_ip" "myterraformpublicip" {
    name                         = "trinity-public-ip"
    location                     = "eastus"
    resource_group_name          = azurerm_resource_group.myterraformgroup.name
    allocation_method            = "Dynamic"

    tags = {
        environment = "Velocity Demo"
    }
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A NETWORK SECURITY GROUP
# ---------------------------------------------------------------------------------------------------------------------

resource "azurerm_network_security_group" "myterraformnsg" {
    name                = "trinity-network-sec-group"
    location            = "eastus"
    resource_group_name = azurerm_resource_group.myterraformgroup.name
    
    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags = {
        environment = "Velocity Demo"
    }
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A VIRTUAL NETWORK INTERFACE CARD
# --------------------------------------------------------------------------------------------------------------------

resource "azurerm_network_interface" "myterraformnic" {
    name                        = "trinity-nic"
    location                    = "eastus"
    resource_group_name         = azurerm_resource_group.myterraformgroup.name

    ip_configuration {
        name                          = "trinity-nic-configuration"
        subnet_id                     = azurerm_subnet.myterraformsubnet.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.myterraformpublicip.id
    }

    tags = {
        environment = "Velocity Demo"
    }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" {
    network_interface_id      = azurerm_network_interface.myterraformnic.id
    network_security_group_id = azurerm_network_security_group.myterraformnsg.id
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A STORAGE ACCOUNT FOR DIAGNOSTICS
# --------------------------------------------------------------------------------------------------------------------

resource "random_id" "randomId" {
    keepers = {
        # Generate a new ID only when a new resource group is defined
        resource_group = azurerm_resource_group.myterraformgroup.name
    }
    
    byte_length = 8
}

resource "azurerm_storage_account" "mystorageaccount" {
    name                        = "diag${random_id.randomId.hex}"
    resource_group_name         = azurerm_resource_group.myterraformgroup.name
    location                    = "eastus"
    account_replication_type    = "LRS"
    account_tier                = "Standard"

    tags = {
        environment = "Velocity Demo"
    }
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE THE VIRTUAL MACHINE
# --------------------------------------------------------------------------------------------------------------------

resource "tls_private_key" "example_ssh" {
  algorithm = "RSA"
  rsa_bits = 4096
}

#output "tls_private_key" { value = "tls_private_key.example_ssh.private_key_pem" }

resource "azurerm_linux_virtual_machine" "myterraformvm" {
    name                  = "trinity-db"
    location              = "eastus"
    resource_group_name   = azurerm_resource_group.myterraformgroup.name
    network_interface_ids = [azurerm_network_interface.myterraformnic.id]
    size                  = "Standard_DS1_v2"

    os_disk {
        name              = "trinity-os-disk"
        caching           = "ReadWrite"
        storage_account_type = "Premium_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04.0-LTS"
        version   = "latest"
    }

    computer_name                   = "trinity-db"
    admin_username                  = "azureuser"
    disable_password_authentication = true
        
    admin_ssh_key {
        username       = "azureuser"
        public_key     = tls_private_key.example_ssh.public_key_openssh
    }

    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.mystorageaccount.primary_blob_endpoint
    }

    tags = {
        environment = "Velocity Demo"
    }
}

