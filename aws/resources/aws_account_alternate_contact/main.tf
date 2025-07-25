resource "aws_account_alternate_contact" "aws_account_alternate_contact" {
  count                  = var.create_alternate_contacts ? length(var.alternate_contacts) : 0
  account_id             = var.alternate_contacts[count.index].account_id
  alternate_contact_type = var.alternate_contacts[count.index].alternate_contact_type
  email_address          = var.alternate_contacts[count.index].email_address
  name                   = var.alternate_contacts[count.index].name
  phone_number           = var.alternate_contacts[count.index].phone_number
  title                  = var.alternate_contacts[count.index].title

  lifecycle {
    prevent_destroy = true
  }
}