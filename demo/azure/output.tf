# ---------------------------------------------------------------------------------------------------------------------
# DEFINE THE OUTPUTS
# ---------------------------------------------------------------------------------------------------------------------

output "id" {
  value       = azurerm_linux_virtual_machine.myterraformvm.virtual_machine_id
  description = "The Azure VM Instance ID"
}

output "public_ip" {
  value       = azurerm_linux_virtual_machine.myterraformvm.public_ip_address
  description = "The public IP of the instance"
}

output "public_dns" {
  value       = azurerm_linux_virtual_machine.myterraformvm.public_ip_address
  description = "The public DNS of the instance"
}

