terraform {
  required_version = ">= 0.11.1"
}

module "windowsserver" {
  source              = "Azure/compute/azurerm"
  version             = "1.2.1"
  location            = "${var.location}"
  resource_group_name = "${var.windows_dns_prefix}-rc"
  vm_hostname         = "pwc-ptfe"
  admin_password      = "${var.admin_password}"
  vm_os_simple        = "WindowsServer"
  is_windows_image    = "true"
  public_ip_dns       = ["${var.windows_dns_prefix}"]
  vnet_subnet_id      = "${module.network.vnet_subnets[0]}"

  tags = {
    Owner = "${var.owner}"
    TTL   = "${var.ttl}"
  }
}

module "network" {
  source              = "Azure/network/azurerm"
  version             = "1.1.1"
  location            = "${var.location}"
  resource_group_name = "${var.windows_dns_prefix}-rc"
  allow_ssh_traffic   = true

  tags = {
    Owner = "${var.owner}"
    TTL   = "${var.ttl}"
  }
}
