//--------------------------------------------------------------------
// Variables
variable "compute_public_ip_dns" {}
variable "compute_resource_group_name" {}
variable "compute_vm_hostname" {}
variable "network_resource_group_name" {}

//--------------------------------------------------------------------
// Modules
module "compute" {
  source  = "tfe.ddat.team/DDAT/compute/azurerm"
  version = "2.0.0"

  location = "uksouth"
  nb_instances = 1
  nb_public_ip = 0
  public_ip_dns = "${var.compute_public_ip_dns}"
  resource_group_name = "${var.compute_resource_group_name}"
  vm_hostname = "${var.compute_vm_hostname}"
  vm_os_simple = "UbuntuServer"
  vnet_subnet_id = "${module.network.vnet_subnets[0]}"
}

module "network" {
  source  = "tfe.ddat.team/DDAT/network/azurerm"
  version = "2.0.0"

  location = "uksouth"
  resource_group_name = "${var.network_resource_group_name}"
}