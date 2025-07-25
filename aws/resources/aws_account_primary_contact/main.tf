resource "aws_account_primary_contact" "aws_account_primary_contact" {
  count               = var.create_primary_contact ? 1 : 0
  account_id          = var.primary_contact.account_id
  address_line_1      = var.primary_contact.address_line_1
  address_line_2      = var.primary_contact.address_line_2
  address_line_3      = var.primary_contact.address_line_3
  city                = var.primary_contact.city
  company_name        = var.primary_contact.company_name
  country_code        = var.primary_contact.country_code
  district_or_county  = var.primary_contact.district_or_county
  full_name           = var.primary_contact.full_name
  phone_number        = var.primary_contact.phone_number
  postal_code         = var.primary_contact.postal_code
  state_or_region     = var.primary_contact.state_or_region
  website_url         = var.primary_contact.website_url

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [
      address_line_2,
      address_line_3,
      district_or_county,
      website_url
    ]
  }
}