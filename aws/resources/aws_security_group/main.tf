resource "aws_security_group" "r_aws_security_group" {
  #  Ingress and Egress have been omitted as they are included in the
  #  aws_vpc_security_group_ingress_rule and aws_vpc_security_group_egress_rule resources

  description            = var.description
  id                     = var.id
  name                   = var.name
  name_prefix            = var.name_prefix
  revoke_rules_on_delete = var.revoke_rules_on_delete
  tags                   = var.tags
  tags_all               = var.tags_all
  vpc_id                 = var.vpc_id
}

git init
git remote add origin git@github.com:ebogdum/terraform-providers.git
git branch -M main
git push -uf origin main

git remote add origin git@gitlab.com:yload/infrastructure/terraform-modules.git
git branch -M main
git push -uf origin main
