output "source_volume" {
  description = "The volume name to use in container definition mount point"
  value       = module.volume_label.id
}

output "container_depends_on" {
  value = local.output_container_depends_on
}

output "container_depends_on_list" {
  value = [local.output_container_depends_on]
}

output "json_map_objects" {
  value = [
    module.copy_from_s3.json_map_object,
    module.mobius3.json_map_object
  ]
}
