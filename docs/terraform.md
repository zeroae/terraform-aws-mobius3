<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_mobius3"></a> [mobius3](#module\_mobius3) | git::https://github.com/cloudposse/terraform-aws-ecs-container-definition.git | tags/0.57.0 |
| <a name="module_volume_label"></a> [volume\_label](#module\_volume\_label) | git::https://github.com/cloudposse/terraform-null-label.git | tags/0.24.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_id"></a> [bucket\_id](#input\_bucket\_id) | Bucket Name (aka ID) | `any` | n/a | yes |
| <a name="input_bucket_key_prefix"></a> [bucket\_key\_prefix](#input\_bucket\_key\_prefix) | The key prefix to use for the bucket objects. | `any` | n/a | yes |
| <a name="input_bucket_region"></a> [bucket\_region](#input\_bucket\_region) | Bucket Region | `any` | n/a | yes |
| <a name="input_log_configuration"></a> [log\_configuration](#input\_log\_configuration) | Log configuration options to send to a custom log driver for the container. For more details, see https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_LogConfiguration.html | `any` | `null` | no |
| <a name="input_mobius3_image"></a> [mobius3\_image](#input\_mobius3\_image) | The Mobius3 Image for S3<->FS synchronization | `string` | `"ghcr.io/zeroae/terraform-aws-mobius3:0.0.34"` | no |
| <a name="input_user"></a> [user](#input\_user) | The user that owns the volume. Can be any of these formats: uid, uid:gid. The default is (0:0). | `string` | `"0:0"` | no |
| <a name="input_volume_name"></a> [volume\_name](#input\_volume\_name) | The volume name. | `string` | `"data"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_container_depends_on"></a> [container\_depends\_on](#output\_container\_depends\_on) | n/a |
| <a name="output_container_depends_on_list"></a> [container\_depends\_on\_list](#output\_container\_depends\_on\_list) | n/a |
| <a name="output_json_map_objects"></a> [json\_map\_objects](#output\_json\_map\_objects) | n/a |
| <a name="output_source_volume"></a> [source\_volume](#output\_source\_volume) | The volume name to use in container definition mount point |
<!-- markdownlint-restore -->
