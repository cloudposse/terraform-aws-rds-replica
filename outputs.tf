output "instance_id" {
  value       = join("", aws_db_instance.default[*].id)
  description = "ID of the instance"
}

output "instance_address" {
  value       = join("", aws_db_instance.default[*].address)
  description = "Address of the instance"
}

output "instance_endpoint" {
  value       = join("", aws_db_instance.default[*].endpoint)
  description = "DNS Endpoint of the instance"
}

output "subnet_group_id" {
  value       = join("", aws_db_subnet_group.default[*].id)
  description = "ID of the Subnet Group"
}

output "security_group_id" {
  value       = join("", aws_security_group.default[*].id)
  description = "ID of the Security Group"
}

output "hostname" {
  value       = module.dns_host_name.hostname
  description = "DNS host name of the instance"
}

output "parameter_group_name" {
  value       = var.parameter_group_name
  description = "parameter_group_name"
}

output "db_parameter" {
  value       = var.db_parameter
  description = "db_parameter"
}
