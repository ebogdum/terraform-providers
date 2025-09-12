resource "aws_ssm_patch_group" "this" {
  region      = var.region
  baseline_id = var.baseline_id
  patch_group = var.patch_group
}