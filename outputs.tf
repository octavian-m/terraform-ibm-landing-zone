
##############################################################################

##############################################################################
# Bastion Host Outputs
##############################################################################

output "bastion_host_names" {
  description = "List of bastion host names"
  value = flatten([
    for instance in keys(module.bastion_host) :
    module.bastion_host[instance].list[*].name
  ])
}

##############################################################################



##############################################################################
# VPC Outputs
##############################################################################

output "vpc_names" {
  description = "List of VPC names"
  value = [
    for network in module.vpc :
    network.vpc_name
  ]
}

output "subnet_names" {
  description = "List of Subnet names created"
  value = flatten([
    for network in module.vpc :
    network.subnet_zone_list[*].name
  ])
}

##############################################################################

##############################################################################
# Resource Group Outputs
##############################################################################

output "resource_group_names" {
  description = "List of resource groups names used within landing zone."
  value       = keys(local.resource_groups)
}

##############################################################################



##############################################################################
# Security Group Outputs
##############################################################################

output "security_group_names" {
  description = "List of security group names"
  value = [
    for group in ibm_is_security_group.security_group :
    group.name
  ]
}

##############################################################################



##############################################################################
# SSH Key Outputs
##############################################################################

output "ssh_key_names" {
  description = "List of SSH Key names"
  value       = module.ssh_keys.ssh_keys[*].name
}

##############################################################################

