<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dns_host_name"></a> [dns\_host\_name](#module\_dns\_host\_name) | git::https://github.com/cloudposse/terraform-aws-route53-cluster-hostname.git | tags/0.13.0 |
| <a name="module_final_snapshot_label"></a> [final\_snapshot\_label](#module\_final\_snapshot\_label) | git::https://github.com/cloudposse/terraform-null-label.git | tags/0.25.0 |
| <a name="module_label"></a> [label](#module\_label) | git::https://github.com/cloudposse/terraform-null-label.git | tags/0.25.0 |

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_kms_key.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_security_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.allow_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.allow_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_major_version_upgrade"></a> [allow\_major\_version\_upgrade](#input\_allow\_major\_version\_upgrade) | Allow major version upgrade | `string` | `"false"` | no |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Specifies whether any database modifications are applied immediately, or during the next maintenance window | `string` | `"false"` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | Allow automated minor version upgrade (e.g. from Postgres 9.5.3 to Postgres 9.5.4) | `string` | `"true"` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | Backup retention period in days. Must be > 0 to enable backups | `string` | `0` | no |
| <a name="input_backup_window"></a> [backup\_window](#input\_backup\_window) | When AWS can perform DB snapshots, can't overlap with maintenance window | `string` | `"22:00-03:00"` | no |
| <a name="input_copy_tags_to_snapshot"></a> [copy\_tags\_to\_snapshot](#input\_copy\_tags\_to\_snapshot) | Copy tags from DB to a snapshot | `string` | `"true"` | no |
| <a name="input_database_port"></a> [database\_port](#input\_database\_port) | Database port (\_e.g.\_ `3306` for `MySQL`). Used in the DB Security Group to allow access to the DB instance from the provided `security_group_ids` | `string` | n/a | yes |
| <a name="input_db_parameter"></a> [db\_parameter](#input\_db\_parameter) | A list of DB parameters to apply. Note that parameters may differ from a DB family to another | `list(string)` | `[]` | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between `name`, `namespace`, `stage` and `attributes` | `string` | `"-"` | no |
| <a name="input_dns_zone_id"></a> [dns\_zone\_id](#input\_dns\_zone\_id) | The ID of the DNS Zone in Route53 where a new DNS record will be created for the DB host name | `string` | `""` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `"true"` | no |
| <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier) | Final snapshot identifier e.g.: some-db-final-snapshot-2015-06-26-06-05 | `string` | `""` | no |
| <a name="input_host_name"></a> [host\_name](#input\_host\_name) | The DB host name created in Route53 | `string` | `"db"` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | Class of RDS instance | `string` | n/a | yes |
| <a name="input_iops"></a> [iops](#input\_iops) | The amount of provisioned IOPS. Setting this implies a storage\_type of 'io1'. Default is 0 if rds storage type is not 'io1' | `string` | `"0"` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN | `string` | `""` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi' UTC | `string` | `"Mon:03:00-Mon:04:00"` | no |
| <a name="input_monitoring_interval"></a> [monitoring\_interval](#input\_monitoring\_interval) | The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. Valid Values are 0, 1, 5, 10, 15, 30, 60. | `string` | `"0"` | no |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | Set to true if multi AZ deployment must be supported | `string` | `"false"` | no |
| <a name="input_name"></a> [name](#input\_name) | The Name of the application or solution  (e.g. `bastion` or `portal`) | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace (e.g. `eg` or `cp`) | `string` | n/a | yes |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | Name of the DB parameter group to associate | `string` | `""` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | Determines if database can be publicly available (NOT recommended) | `string` | `"false"` | no |
| <a name="input_replicate_source_db"></a> [replicate\_source\_db](#input\_replicate\_source\_db) | Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate. Note that if you are creating a cross-region replica of an encrypted database you will also need to specify a kms\_key\_id. See [DB Instance Replication](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Replication.html) and [Working with PostgreSQL and MySQL Read Replicas](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReadRepl.html) for more information on using Replication. | `string` | n/a | yes |
| <a name="input_same_region"></a> [same\_region](#input\_same\_region) | Whether this replica is in the same region as the master. | `string` | `"false"` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | The IDs of the security groups from which to allow `ingress` traffic to the DB instance | `list(string)` | `[]` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | If true (default), no snapshot will be made before deleting DB | `string` | `"true"` | no |
| <a name="input_snapshot_identifier"></a> [snapshot\_identifier](#input\_snapshot\_identifier) | Snapshot identifier e.g: rds:production-2015-06-26-06-05. If specified, the module create cluster from the snapshot | `string` | `""` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | Stage (e.g. `prod`, `dev`, `staging`) | `string` | n/a | yes |
| <a name="input_storage_encrypted"></a> [storage\_encrypted](#input\_storage\_encrypted) | Specifies whether the DB instance is encrypted. The default is false if not specified. | `string` | `"false"` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). | `string` | `"standard"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnets for the DB | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. map(`BusinessUnit`,`XYZ`) | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID the DB instance will be created in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_parameter"></a> [db\_parameter](#output\_db\_parameter) | db\_parameter |
| <a name="output_hostname"></a> [hostname](#output\_hostname) | DNS host name of the instance |
| <a name="output_instance_address"></a> [instance\_address](#output\_instance\_address) | Address of the instance |
| <a name="output_instance_endpoint"></a> [instance\_endpoint](#output\_instance\_endpoint) | DNS Endpoint of the instance |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | ID of the instance |
| <a name="output_parameter_group_name"></a> [parameter\_group\_name](#output\_parameter\_group\_name) | parameter\_group\_name |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | ID of the Security Group |
| <a name="output_subnet_group_id"></a> [subnet\_group\_id](#output\_subnet\_group\_id) | ID of the Subnet Group |
<!-- markdownlint-restore -->
