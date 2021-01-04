<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0, < 0.14.0 |
| local | ~> 1.2 |
| random | ~> 2.2 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| awscli\_image | The AWSCLI Compatible Image | `string` | `"docker.io/amazon/aws-cli:2.0.52"` | no |
| bucket\_id | Bucket Name (aka ID) | `any` | n/a | yes |
| bucket\_key\_prefix | The key prefix to use for the bucket objects. | `any` | n/a | yes |
| bucket\_region | Bucket Region | `any` | n/a | yes |
| log\_configuration | Log configuration options to send to a custom log driver for the container. For more details, see https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_LogConfiguration.html | `any` | `null` | no |
| mobius3\_image | The Mobius3 Image for S3<->FS synchronization | `string` | `"quay.io/uktrade/mobius3:v0.0.32"` | no |
| user | The user that owns the volume. Can be any of these formats: uid, uid:gid. The default is (0:0). | `string` | `"0:0"` | no |
| volume\_name | The volume name. | `string` | `"data"` | no |

## Outputs

| Name | Description |
|------|-------------|
| container\_depends\_on | n/a |
| container\_depends\_on\_list | n/a |
| json\_map\_objects | n/a |
| source\_volume | The volume name to use in container definition mount point |

<!-- markdownlint-restore -->
