output "arn" {
  description = "ARN of the Contact Flow Module"
  value       = data.aws_connect_contact_flow_module.this.arn
}

output "content" {
  description = "Logic of the Contact Flow Module"
  value       = data.aws_connect_contact_flow_module.this.content
}

output "description" {
  description = "Description of the Contact Flow Module"
  value       = data.aws_connect_contact_flow_module.this.description
}

output "tags" {
  description = "Map of tags to assign to the Contact Flow Module"
  value       = data.aws_connect_contact_flow_module.this.tags
}

output "state" {
  description = "Type of Contact Flow Module Module. Values are either ACTIVE or ARCHIVED"
  value       = data.aws_connect_contact_flow_module.this.state
}

output "status" {
  description = "Status of the Contact Flow Module Module. Values are either PUBLISHED or SAVED"
  value       = data.aws_connect_contact_flow_module.this.status
}

output "instance_id" {
  description = "Reference to the hosting Amazon Connect Instance"
  value       = data.aws_connect_contact_flow_module.this.instance_id
}

output "contact_flow_module_id" {
  description = "Contact Flow Module ID"
  value       = data.aws_connect_contact_flow_module.this.contact_flow_module_id
}

output "name" {
  description = "Contact Flow Module name"
  value       = data.aws_connect_contact_flow_module.this.name
}