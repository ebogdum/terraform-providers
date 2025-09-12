data "aws_kms_secret" "this" {
  # This data source is deprecated as of Terraform AWS Provider v2.0.0
  # Please use aws_kms_secrets data source instead
  
  lifecycle {
    # Warn users about deprecation
    postcondition {
      condition     = false
      error_message = "data.aws_kms_secret is deprecated since Terraform AWS Provider v2.0.0. Please migrate to aws_kms_secrets data source."
    }
  }
}