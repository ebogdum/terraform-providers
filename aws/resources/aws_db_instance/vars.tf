variable "allocated_storage" {
  type    = number
  default = null
}
variable "allow_major_version_upgrade" {
  type    = bool
  default = null
}
variable "apply_immediately" {
  type    = bool
  default = null
}
variable "auto_minor_version_upgrade" {
  type    = bool
  default = null
}
variable "availability_zone" {
  type    = string
  default = null
}
variable "backup_retention_period" {
  type    = number
  default = null
}
variable "backup_target" {
  type    = string
  default = null
}
variable "backup_window" {
  type    = string
  default = null
}
variable "ca_cert_identifier" {
  type    = string
  default = null
}
variable "character_set_name" {
  type    = string
  default = null
}
variable "copy_tags_to_snapshot" {
  type    = bool
  default = null
}
variable "custom_iam_instance_profile" {
  type    = string
  default = null
}
variable "customer_owned_ip_enabled" {
  type    = bool
  default = null
}
variable "db_name" {
  type    = string
  default = null
}
variable "db_subnet_group_name" {
  type    = string
  default = null
}
variable "dedicated_log_volume" {
  type    = bool
  default = null
}
variable "delete_automated_backups" {
  type    = bool
  default = null
}
variable "deletion_protection" {
  type    = bool
  default = null
}
variable "domain" {
  type    = string
  default = null
}
variable "domain_auth_secret_arn" {
  type    = string
  default = null
}
variable "domain_dns_ips" {
  type    = set(string)
  default = null
}
variable "domain_fqdn" {
  type    = string
  default = null
}
variable "domain_iam_role_name" {
  type    = string
  default = null
}
variable "domain_ou" {
  type    = string
  default = null
}
variable "enabled_cloudwatch_logs_exports" {
  type    = set(string)
  default = null
}
variable "engine" {
  type    = string
  default = null
}
variable "engine_version" {
  type    = string
  default = null
}
variable "final_snapshot_identifier" {
  type    = string
  default = null
}
variable "iam_database_authentication_enabled" {
  type    = bool
  default = null
}
variable "id" {
  type    = string
  default = null
}
variable "identifier" {
  type    = string
  default = null
}
variable "identifier_prefix" {
  type    = string
  default = null
}
variable "instance_class" {
  type = string
}
variable "iops" {
  type    = number
  default = null
}
variable "kms_key_id" {
  type    = string
  default = null
}
variable "license_model" {
  type    = string
  default = null
}
variable "maintenance_window" {
  type    = string
  default = null
}
variable "manage_master_user_password" {
  type    = bool
  default = null
}
variable "master_user_secret_kms_key_id" {
  type    = string
  default = null
}
variable "max_allocated_storage" {
  type    = number
  default = null
}
variable "monitoring_interval" {
  type    = number
  default = null
}
variable "monitoring_role_arn" {
  type    = string
  default = null
}
variable "multi_az" {
  type    = bool
  default = null
}
variable "nchar_character_set_name" {
  type    = string
  default = null
}
variable "network_type" {
  type    = string
  default = null
}
variable "option_group_name" {
  type    = string
  default = null
}
variable "parameter_group_name" {
  type    = string
  default = null
}
variable "password" {
  type    = string
  default = null
}
variable "performance_insights_enabled" {
  type    = bool
  default = null
}
variable "performance_insights_kms_key_id" {
  type    = string
  default = null
}
variable "performance_insights_retention_period" {
  type    = number
  default = null
}
variable "port" {
  type    = number
  default = null
}
variable "publicly_accessible" {
  type    = bool
  default = null
}
variable "replica_mode" {
  type    = string
  default = null
}
variable "replicate_source_db" {
  type    = string
  default = null
}
variable "skip_final_snapshot" {
  type    = bool
  default = null
}
variable "snapshot_identifier" {
  type    = string
  default = null
}
variable "storage_encrypted" {
  type    = bool
  default = null
}
variable "storage_throughput" {
  type    = number
  default = null
}
variable "storage_type" {
  type    = string
  default = null
}
variable "tags" {
  type    = map(string)
  default = null
}
variable "tags_all" {
  type    = map(string)
  default = null
}
variable "timezone" {
  type    = string
  default = null
}
variable "username" {
  type    = string
  default = null
}
variable "vpc_security_group_ids" {
  type    = set(string)
  default = null
}
