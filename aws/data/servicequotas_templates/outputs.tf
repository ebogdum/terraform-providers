output "templates" {
  description = "A list of quota increase templates for specified region."
  value       = data.aws_servicequotas_templates.this.templates
}

output "templates_global_quota" {
  description = "List of global quota indicators for each template."
  value       = [for template in data.aws_servicequotas_templates.this.templates : template.global_quota]
}

output "templates_quota_name" {
  description = "List of quota names for each template."
  value       = [for template in data.aws_servicequotas_templates.this.templates : template.quota_name]
}

output "templates_quota_code" {
  description = "List of quota identifiers for each template."
  value       = [for template in data.aws_servicequotas_templates.this.templates : template.quota_code]
}

output "templates_region" {
  description = "List of AWS regions for each template."
  value       = [for template in data.aws_servicequotas_templates.this.templates : template.region]
}

output "templates_service_code" {
  description = "List of service identifiers for each template."
  value       = [for template in data.aws_servicequotas_templates.this.templates : template.service_code]
}

output "templates_service_name" {
  description = "List of service names for each template."
  value       = [for template in data.aws_servicequotas_templates.this.templates : template.service_name]
}

output "templates_unit" {
  description = "List of units of measurement for each template."
  value       = [for template in data.aws_servicequotas_templates.this.templates : template.unit]
}

output "templates_value" {
  description = "List of new, increased values for the quota for each template."
  value       = [for template in data.aws_servicequotas_templates.this.templates : template.value]
}