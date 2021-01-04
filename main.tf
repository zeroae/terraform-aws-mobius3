locals {
  key_prefix = trimsuffix(var.bucket_key_prefix, "/")
}

module "volume_label" {
  source      = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.19.2"
  name        = var.volume_name
  delimiter   = "_"
  label_order = ["name"]
}

module "copy_from_s3" {
  source          = "git::https://github.com/cloudposse/terraform-aws-ecs-container-definition.git?ref=tags/0.41.0"
  container_name  = "copy_from_s3"
  container_image = var.awscli_image
  essential       = false

  user = var.user

  entrypoint = [
    "/bin/sh"
  ]
  command = [
    "-c",
    join(";", [
      "set -e",
      "aws s3 sync s3://${var.bucket_id}/${local.key_prefix}/${module.volume_label.id}/ /srv/data",
      "chown -R ${var.user} /srv/data",
    ])
  ]

  mount_points = [
    {
      containerPath = "/srv/data"
      sourceVolume  = module.volume_label.id
    }
  ]

  log_configuration = var.log_configuration
}

# TODO: Implement a health check
# TODO: Support multiple volumes
module "mobius3" {
  source          = "git::https://github.com/cloudposse/terraform-aws-ecs-container-definition.git?ref=tags/0.41.0"
  container_name  = "mobius3"
  container_image = var.mobius3_image
  essential       = true

  container_depends_on = [
    {
      containerName = module.copy_from_s3.json_map_object["name"]
      condition     = "SUCCESS"
    },
  ]

  user = var.user

  command = [
    "mobius3",
    "/srv/data",
    var.bucket_id,
    "https://{}.s3.${var.bucket_region}.amazonaws.com/",
    var.bucket_region,
    "--prefix", "${local.key_prefix}/${module.volume_label.id}/",
    "--credentials-source", "ecs-container-endpoint",
    "--log-level", "INFO"
  ]

  mount_points = [
    {
      containerPath = "/srv/data"
      sourceVolume  = module.volume_label.id
    }
  ]

  log_configuration = var.log_configuration
}

locals {
  output_container_depends_on = {
    containerName = module.mobius3.json_map_object["name"]
    # TODO: Use HEALTHY once we have a healthcheck
    condition = "START"
  }
}
