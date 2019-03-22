## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| allow_major_version_upgrade | Allow major version upgrade | string | `false` | no |
| apply_immediately | Specifies whether any database modifications are applied immediately, or during the next maintenance window | string | `false` | no |
| attributes | Additional attributes (e.g. `1`) | list | `<list>` | no |
| auto_minor_version_upgrade | Allow automated minor version upgrade (e.g. from Postgres 9.5.3 to Postgres 9.5.4) | string | `true` | no |
| backup_retention_period | Backup retention period in days. Must be > 0 to enable backups | string | `0` | no |
| backup_window | When AWS can perform DB snapshots, can't overlap with maintenance window | string | `22:00-03:00` | no |
| copy_tags_to_snapshot | Copy tags from DB to a snapshot | string | `true` | no |
| database_port | Database port (_e.g._ `3306` for `MySQL`). Used in the DB Security Group to allow access to the DB instance from the provided `security_group_ids` | string | - | yes |
| db_parameter | A list of DB parameters to apply. Note that parameters may differ from a DB family to another | list | `<list>` | no |
| delimiter | Delimiter to be used between `name`, `namespace`, `stage` and `attributes` | string | `-` | no |
| dns_zone_id | The ID of the DNS Zone in Route53 where a new DNS record will be created for the DB host name | string | `` | no |
| enabled | Set to false to prevent the module from creating any resources | string | `true` | no |
| final_snapshot_identifier | Final snapshot identifier e.g.: some-db-final-snapshot-2015-06-26-06-05 | string | `` | no |
| host_name | The DB host name created in Route53 | string | `db` | no |
| instance_class | Class of RDS instance | string | - | yes |
| iops | The amount of provisioned IOPS. Setting this implies a storage_type of 'io1'. Default is 0 if rds storage type is not 'io1' | string | `0` | no |
| kms_key_id | The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN | string | `` | no |
| maintenance_window | The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi' UTC | string | `Mon:03:00-Mon:04:00` | no |
| monitoring_interval | The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. Valid Values are 0, 1, 5, 10, 15, 30, 60. | string | `0` | no |
| multi_az | Set to true if multi AZ deployment must be supported | string | `false` | no |
| name | The Name of the application or solution  (e.g. `bastion` or `portal`) | string | - | yes |
| namespace | Namespace (e.g. `eg` or `cp`) | string | - | yes |
| parameter_group_name | Name of the DB parameter group to associate | string | `` | no |
| publicly_accessible | Determines if database can be publicly available (NOT recommended) | string | `false` | no |
| replicate_source_db | Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate. Note that if you are creating a cross-region replica of an encrypted database you will also need to specify a kms_key_id. See [DB Instance Replication](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Replication.html) and [Working with PostgreSQL and MySQL Read Replicas](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReadRepl.html) for more information on using Replication. | string | - | yes |
| same_region | Whether this replica is in the same region as the master. | string | `false` | no |
| security_group_ids | The IDs of the security groups from which to allow `ingress` traffic to the DB instance | list | `<list>` | no |
| skip_final_snapshot | If true (default), no snapshot will be made before deleting DB | string | `true` | no |
| snapshot_identifier | Snapshot identifier e.g: rds:production-2015-06-26-06-05. If specified, the module create cluster from the snapshot | string | `` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | - | yes |
| storage_encrypted | Specifies whether the DB instance is encrypted. The default is false if not specified. | string | `false` | no |
| storage_type | One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). | string | `standard` | no |
| subnet_ids | List of subnets for the DB | list | - | yes |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`) | map | `<map>` | no |
| vpc_id | VPC ID the DB instance will be created in | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| hostname | DNS host name of the instance |
| instance_address | Address of the instance |
| instance_endpoint | DNS Endpoint of the instance |
| instance_id | ID of the instance |
| security_group_id | ID of the Security Group |
| subnet_group_id | ID of the Subnet Group |

