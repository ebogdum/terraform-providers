output "primary_contact_full_name" {
  description = "The full name of the AWS Account primary contact."
  value       = var.create_primary_contact ? var.primary_contact.full_name : null
}

output "primary_contact_phone_number" {
  description = "The phone number of the AWS Account primary contact."
  value       = var.create_primary_contact ? var.primary_contact.phone_number : null
}

output "primary_contact_account_id" {
  description = "The AWS Account ID associated with the primary contact. Defaults to the current user's account if not specified."
  value       = var.create_primary_contact ? var.primary_contact.account_id : null
}