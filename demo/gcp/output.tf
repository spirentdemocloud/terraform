# ---------------------------------------------------------------------------------------------------------------------
# DEFINE THE OUTPUTS
# ---------------------------------------------------------------------------------------------------------------------

output "id" {
  value       = google_compute_instance.vm_instance.instance_id
  description = "The GCP Instance ID"
}

output "public_ip" {
  value       = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
  description = "The public IP of the instance"
}

output "public_dns" {
  value       = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
  description = "The public DNS of the instance"
}


