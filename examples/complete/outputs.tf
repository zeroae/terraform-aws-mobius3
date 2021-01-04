output "json_map_objects" {
  description = "The mobius3 container definitions"
  value       = module.mobius3.json_map_objects
}

output "container_depends_on" {
  description = "The mobius3 container dependency"
  value       = module.mobius3.container_depends_on
}
