resource "azurerm_kubernetes_cluster" "aks" {
  name                = "capstone-${var.random_integer}-AKS"
  location            = var.rg_location
  resource_group_name = var.rg_name
  dns_prefix          = "capstone-${var.random_integer}-k8s"
  kubernetes_version  = "1.28.10"

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_B2ms"
    os_disk_size_gb = 50
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  role_based_access_control_enabled = true

  tags = {
    environment = "Capstone"
  }
}