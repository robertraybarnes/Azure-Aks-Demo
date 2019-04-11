/*resource group to run the kubernetes cluster in
the azure region should be changed in the variables.tf file if required*/
resource "azurerm_resource_group" "aksdemo_rg" {
  name     = "${var.aksdemo_rg}"
  location = "${var.default_region}"

  tags {
    environment = "${var.environment}"
    name        = "${var.aksdemo_rg}"
  }
}

//Storage account for container registry
resource "azurerm_storage_account" "aksdemo_sa" {
  name                     = "${var.aksdemo_sa}"
  location                 = "${azurerm_resource_group.aksdemo_rg.location}"
  resource_group_name      = "${azurerm_resource_group.aksdemo_rg.name}"
  account_replication_type = "LRS"
  account_tier             = "Standard"

  tags {
    environment = "${var.environment}"
    name        = "${var.aksdemo_sa}"
  }

  depends_on = ["azurerm_resource_group.aksdemo_rg"]
}

//container registry
resource "azurerm_container_registry" "aksdemo_cr" {
  name                = "${var.aksdemo_cr}"
  resource_group_name = "${azurerm_resource_group.aksdemo_rg.name}"
  location            = "${azurerm_resource_group.aksdemo_rg.location}"
  admin_enabled       = "true"
  sku                 = "Classic"
  storage_account_id  = "${azurerm_storage_account.aksdemo_sa.id}"

  tags {
    name        = "${var.aksdemo_cr}"
    environment = "${var.environment}"
  }

  depends_on = ["azurerm_resource_group.aksdemo_rg", "azurerm_storage_account.aksdemo_sa"]
}

//Azure Kubernetes Service Cluster
resource "azurerm_kubernetes_cluster" "aksdemocluster" {
  name                = "${var.aksdemocluster}"
  location            = "${azurerm_resource_group.aksdemo_rg.location}"
  resource_group_name = "${azurerm_resource_group.aksdemo_rg.name}"
  dns_prefix          = "${var.dns_prefix}"

  kubernetes_version = ""

  agent_pool_profile {
    name            = "default"
    vm_size         = "${var.vm_size}"
    count           = 1
    os_disk_size_gb = 50
    os_type         = "Linux"
  }

  linux_profile {
    admin_username = "${var.admin_username}"

    ssh_key {
      key_data = "${var.ENC__ssh_key}"
    }
  }

  service_principal {
    client_id     = "${var.ENC__sp_client_id}"
    client_secret = "${var.ENC__sp_client_secret}"
  }

  tags {
    environment = "${var.environment}"
  }

  depends_on = ["azurerm_resource_group.aksdemo_rg"]
}
