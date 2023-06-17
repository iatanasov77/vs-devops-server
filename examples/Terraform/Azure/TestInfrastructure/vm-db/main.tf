terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "=3.0.0"
        }
    }
}

provider "azurerm" {
    features {}
}

data "template_cloudinit_config" "config_db" {
  gzip          = true
  base64_encode = true

  # Main cloud-config configuration file.
  part {
    content_type = "text/cloud-config"
    content      = "packages: ['mysql-server']"
  }
}

resource "azurerm_linux_virtual_machine" "VM-DB" {
  name                            = "VM-DB"
  resource_group_name             = var.v_rg_name
  location                        = var.v_rg_location
  size                            = "Standard_B1s"
  disable_password_authentication = "false"
  admin_username                  = "adminuser"
  admin_password                  = "TerraformRulez!"

  # This is where we pass our cloud-init.
  custom_data = data.template_cloudinit_config.config_db.rendered

  network_interface_ids = [
    var.v_nic,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
