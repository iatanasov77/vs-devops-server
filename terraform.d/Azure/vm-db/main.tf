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

    subscription_id = "be8ba630-d939-495c-bb2d-5660abfad06e"
    tenant_id       = "ce79b4ce-a54b-4393-807f-25df142a806b"
    client_id       = "bdda9419-4119-424c-8eea-a78f8a12d4f8"
    client_secret   = "tZOm9jNYIHs5xnNE~5lF54FTg3BOtkkP7Z"
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
