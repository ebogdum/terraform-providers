output "alternate_contact_ids" {
  description = "List of alternate contact types successfully created. This reflects the alternate_contact_type values managed."
  value       = var.create_alternate_contacts ? [for contact in var.alternate_contacts : contact.alternate_contact_type] : []
}