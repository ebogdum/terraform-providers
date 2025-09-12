output "arn" {
  description = "ARN (Amazon Resource Name) of the CloudFront real-time log configuration"
  value       = data.aws_cloudfront_realtime_log_config.this.arn
}

output "endpoint" {
  description = "Amazon Kinesis data streams where real-time log data is sent"
  value       = data.aws_cloudfront_realtime_log_config.this.endpoint
}

output "fields" {
  description = "Fields that are included in each real-time log record"
  value       = data.aws_cloudfront_realtime_log_config.this.fields
}

output "name" {
  description = "Unique name to identify this real-time log configuration"
  value       = data.aws_cloudfront_realtime_log_config.this.name
}

output "sampling_rate" {
  description = "Sampling rate for this real-time log configuration"
  value       = data.aws_cloudfront_realtime_log_config.this.sampling_rate
}