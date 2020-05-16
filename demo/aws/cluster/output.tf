# ---------------------------------------------------------------------------------------------------------------------
# DEFINE THE OUTPUTSS
# ---------------------------------------------------------------------------------------------------------------------

output "id" {
  value       = aws_elb.load_balancer.id
  description = "The AWS ID  of the load balancer"
}

output "public_ip" {
  value       = aws_elb.load_balancer.dns_name
  description = "The public IP of the load balancer"
}

output "public_dns" {
  value       = aws_elb.load_balancer.dns_name
  description = "The domain name of the load balancer"
}
