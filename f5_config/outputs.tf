##############################################################################
# F5 Outputs
##############################################################################

output "user_data" {
  description = "Cloud Init data for F5 instance"
  value       = data.template_file.user_data.rendered
}

##############################################################################