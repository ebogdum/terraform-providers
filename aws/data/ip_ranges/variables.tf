variable "regions" {
  description = "Filter IP ranges by regions (or include all regions, if omitted). Valid items are 'global' (for 'cloudfront') as well as all AWS regions (e.g., 'eu-central-1')"
  type        = list(string)
  default     = null

  validation {
    condition = var.regions == null || alltrue([
      for region in var.regions : contains([
        "global", "us-east-1", "us-east-2", "us-west-1", "us-west-2",
        "ap-south-1", "ap-northeast-3", "ap-northeast-2", "ap-southeast-1",
        "ap-southeast-2", "ap-northeast-1", "ca-central-1", "eu-central-1",
        "eu-west-1", "eu-west-2", "eu-west-3", "eu-north-1", "sa-east-1"
      ], region)
    ])
    error_message = "data_aws_ip_ranges, regions must be valid AWS regions or 'global'."
  }
}

variable "services" {
  description = "Filter IP ranges by services. Valid items are 'amazon' (for amazon.com), 'amazon_connect', 'api_gateway', 'cloud9', 'cloudfront', 'codebuild', 'dynamodb', 'ec2', 'ec2_instance_connect', 'globalaccelerator', 'route53', 'route53_healthchecks', 's3' and 'workspaces_gateways'"
  type        = list(string)

  validation {
    condition = alltrue([
      for service in var.services : contains([
        "amazon", "amazon_connect", "api_gateway", "cloud9", "cloudfront",
        "codebuild", "dynamodb", "ec2", "ec2_instance_connect",
        "globalaccelerator", "route53", "route53_healthchecks", "s3",
        "workspaces_gateways"
      ], service)
    ])
    error_message = "data_aws_ip_ranges, services must be valid AWS services."
  }
}

variable "url" {
  description = "Custom URL for source JSON file. Syntax must match AWS IP Address Ranges documentation. Defaults to 'https://ip-ranges.amazonaws.com/ip-ranges.json'"
  type        = string
  default     = "https://ip-ranges.amazonaws.com/ip-ranges.json"

  validation {
    condition     = can(regex("^https?://.*\\.json$", var.url))
    error_message = "data_aws_ip_ranges, url must be a valid HTTP(S) URL ending with .json."
  }
}