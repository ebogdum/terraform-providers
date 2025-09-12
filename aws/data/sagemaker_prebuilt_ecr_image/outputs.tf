output "repository_name" {
  description = "Name of the repository, which is generally the algorithm or library."
  value       = data.aws_sagemaker_prebuilt_ecr_image.this.repository_name
}

output "dns_suffix" {
  description = "DNS suffix to use in the registry path."
  value       = data.aws_sagemaker_prebuilt_ecr_image.this.dns_suffix
}

output "image_tag" {
  description = "Image tag for the Docker image."
  value       = data.aws_sagemaker_prebuilt_ecr_image.this.image_tag
}

output "region" {
  description = "Region to use in the registry path."
  value       = data.aws_sagemaker_prebuilt_ecr_image.this.region
}

output "registry_id" {
  description = "Account ID containing the image."
  value       = data.aws_sagemaker_prebuilt_ecr_image.this.registry_id
}

output "registry_path" {
  description = "Docker image URL."
  value       = data.aws_sagemaker_prebuilt_ecr_image.this.registry_path
}