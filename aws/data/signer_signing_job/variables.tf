variable "job_id" {
  description = "ID of the signing job"
  type        = string

  validation {
    condition     = length(var.job_id) > 0
    error_message = "data_aws_signer_signing_job, job_id cannot be empty."
  }

  validation {
    condition     = can(regex("^[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}$", var.job_id))
    error_message = "data_aws_signer_signing_job, job_id must be a valid UUID format."
  }
}

variable "region" {
  description = "AWS region where the signing job is located"
  type        = string
  default     = null

  validation {
    condition     = var.region == null || can(regex("^[a-z]{2}-[a-z]+-[0-9]+$", var.region))
    error_message = "data_aws_signer_signing_job, region must be a valid AWS region format (e.g., us-east-1)."
  }
}