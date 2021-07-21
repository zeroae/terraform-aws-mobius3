locals {
  key_prefix = trimsuffix(var.bucket_key_prefix, "/")
}

module "volume_label" {
  source      = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.24.1"
  name        = var.volume_name
  delimiter   = "_"
  label_order = ["name"]
}

# TODO: Implement a health check
# TODO: Support multiple volumes
module "mobius3" {
  source          = "git::https://github.com/cloudposse/terraform-aws-ecs-container-definition.git?ref=tags/0.57.0"
  container_name  = "mobius3"
  container_image = var.mobius3_image
  essential       = true

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
      readOnly      = false
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
