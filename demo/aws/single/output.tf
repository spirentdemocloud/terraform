# ---------------------------------------------------------------------------------------------------------------------
# DEFINE THE OUTPUTS
# ---------------------------------------------------------------------------------------------------------------------

output "id" {
  value       = aws_instance.web_server.id
  description = "The AWS Instance ID"
}

output "public_ip" {
  value       = aws_instance.web_server.public_ip
  description = "The public IP of the web server"
}

output "public_dns" {
  value       = aws_instance.web_server.public_dns
  description = "The public DNS of the web server"
}

