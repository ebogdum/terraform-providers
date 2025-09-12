variable "dns_name" {
  description = "DNS name of the service (e.g., rds.us-east-1.amazonaws.com). One of dns_name, reverse_dns_name, or service_id is required."
  type        = string
  default     = null

  validation {
    condition     = var.dns_name == null || can(regex("^[a-z0-9.-]+\\.[a-z]+$", var.dns_name))
    error_message = "data_aws_service, dns_name must be a valid DNS name format."
  }
}

variable "partition" {
  description = "Partition corresponding to the Region."
  type        = string
  default     = null

  validation {
    condition     = var.partition == null || contains(["aws", "aws-cn", "aws-us-gov"], var.partition)
    error_message = "data_aws_service, partition must be one of: aws, aws-cn, aws-us-gov."
  }
}

variable "region" {
  description = "Region of the service (e.g., us-west-2, ap-northeast-1). Defaults to the Region set in the provider configuration."
  type        = string
  default     = null

  validation {
    condition     = var.region == null || can(regex("^[a-z0-9-]+$", var.region))
    error_message = "data_aws_service, region must be a valid AWS region format."
  }
}

variable "reverse_dns_name" {
  description = "Reverse DNS name of the service (e.g., com.amazonaws.us-west-2.s3). One of dns_name, reverse_dns_name, or service_id is required."
  type        = string
  default     = null

  validation {
    condition     = var.reverse_dns_name == null || can(regex("^[a-z0-9.-]+$", var.reverse_dns_name))
    error_message = "data_aws_service, reverse_dns_name must be a valid reverse DNS name format."
  }
}

variable "reverse_dns_prefix" {
  description = "Prefix of the service (e.g., com.amazonaws in AWS Commercial, cn.com.amazonaws in AWS China)."
  type        = string
  default     = null

  validation {
    condition     = var.reverse_dns_prefix == null || can(regex("^[a-z0-9.-]+$", var.reverse_dns_prefix))
    error_message = "data_aws_service, reverse_dns_prefix must be a valid DNS prefix format."
  }
}

variable "service_id" {
  description = "Service endpoint ID (e.g., s3, rds, ec2). One of dns_name, reverse_dns_name, or service_id is required. A service's endpoint ID can be found in the AWS General Reference."
  type        = string
  default     = null

  validation {
    condition     = var.service_id == null || can(regex("^[a-z0-9-]+$", var.service_id))
    error_message = "data_aws_service, service_id must be a valid service ID format."
  }
}

variable "required_field_validation" {
  description = "Internal validation to ensure at least one of dns_name, reverse_dns_name, or service_id is provided."
  type        = bool
  default     = true

  validation {
    condition     = var.required_field_validation == true && ((var.dns_name != null) || (var.reverse_dns_name != null) || (var.service_id != null))
    error_message = "data_aws_service, required_field_validation requires at least one of dns_name, reverse_dns_name, or service_id to be provided."
  }
}