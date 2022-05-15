module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.25.0"
  enabled    = var.enabled
  namespace  = var.namespace
  name       = var.name
  stage      = var.stage
  delimiter  = var.delimiter
  attributes = var.attributes
  tags       = var.tags
}

resource "aws_kms_key" "default" {
  count                   = local.enabled && length(var.kms_key_id) == 0 ? 1 : 0
  description             = module.label.id
  deletion_window_in_days = 10
  enable_key_rotation     = true
  tags                    = module.label.tags
}

locals {
  enabled    = var.enabled == "true"
  kms_key_id = length(var.kms_key_id) > 0 ? var.kms_key_id : join("", aws_kms_key.default.*.arn)
}

resource "aws_db_instance" "default" {
  count                       = local.enabled ? 1 : 0
  identifier                  = module.label.id
  port                        = var.database_port
  instance_class              = var.instance_class
  storage_encrypted           = var.storage_encrypted
  vpc_security_group_ids      = aws_security_group.default.*.id
  db_subnet_group_name        = var.create_db_subnet_group ? join("", aws_db_subnet_group.default.*.name) : null
  multi_az                    = var.multi_az
  storage_type                = var.storage_type
  iops                        = var.iops
  publicly_accessible         = var.publicly_accessible
  snapshot_identifier         = length(var.snapshot_identifier) > 0 ? var.snapshot_identifier : null
  allow_major_version_upgrade = var.allow_major_version_upgrade
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  apply_immediately           = var.apply_immediately
  maintenance_window          = var.maintenance_window
  skip_final_snapshot         = true
  backup_retention_period     = var.backup_retention_period > 0 ? var.backup_retention_period : null
  backup_window               = var.backup_retention_period > 0 ? var.backup_window : null
  tags                        = module.label.tags
  kms_key_id                  = length(var.kms_key_id) > 0 ? local.kms_key_id : null
  monitoring_interval         = var.monitoring_interval
  replicate_source_db         = var.replicate_source_db
  timeouts {
    create = "3h"
    delete = "2h"
    update = "80m"
  }
}

resource "aws_db_subnet_group" "default" {
  count      = local.enabled && var.create_db_subnet_group && var.same_region == "false" ? 1 : 0
  name       = module.label.id
  subnet_ids = var.subnet_ids
  tags       = module.label.tags
}

resource "aws_security_group" "default" {
  count       = local.enabled ? 1 : 0
  name        = module.label.id
  description = "Allow inbound traffic from the security groups"
  vpc_id      = var.vpc_id

  tags = module.label.tags
}

locals {
  security_group_id = join("", aws_security_group.default.*.id)
}

resource "aws_security_group_rule" "allow_ingress" {
  count                    = local.enabled ? length(var.security_group_ids) : 0
  security_group_id        = local.security_group_id
  type                     = "ingress"
  from_port                = var.database_port
  to_port                  = var.database_port
  protocol                 = "tcp"
  source_security_group_id = var.security_group_ids[count.index]
}

resource "aws_security_group_rule" "allow_egress" {
  count             = local.enabled ? 1 : 0
  security_group_id = local.security_group_id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

module "dns_host_name" {
  source    = "git::https://github.com/cloudposse/terraform-aws-route53-cluster-hostname.git?ref=tags/0.12.2"
  enabled   = local.enabled && length(var.dns_zone_id) > 0 ? "true" : "false"
  namespace = var.namespace
  name      = var.host_name
  stage     = var.stage
  zone_id   = var.dns_zone_id
  records   = aws_db_instance.default.*.address
}
