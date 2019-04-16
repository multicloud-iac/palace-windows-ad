output "windows_vm_public_name" {
  value = "${module.windowsserver.public_ip_dns_name}"
}
