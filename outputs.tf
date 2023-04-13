output "lake_id" {
  description = "An identifier for the resource with format projects/{{project}}/locations/{{location}}/lakes/{{name}}."
  value       = module.basic_lake.id
}

output "lake_name" {
  description = "The name of the lake resource."
  value       = module.basic_lake.name
}

output "lake_service_account" {
  description = "Service account associated with this lake."
  value       = module.basic_lake.service_account
}

output "zone_id" {
  description = "An identifier for the resource with format projects/{{project}}/locations/{{location}}/lakes/{{lake}}/zones/{{name}}."
  value       = module.basic_zone.id
}

output "zone_name" {
  description = "The name of the zone."
  value       = module.basic_zone.name
}

output "asset_id" {
  description = "An identifier for the resource with format projects/{{project}}/locations/{{location}}/lakes/{{lake}}/zones/{{dataplex_zone}}/assets/{{name}}."
  value       = module.primary.id
}

output "asset_name" {
  description = "The name of the asset."
  value       = module.primary.name
}