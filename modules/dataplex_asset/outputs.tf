output "id" {
  description = "An identifier for the resource with format projects/{{project}}/locations/{{location}}/lakes/{{lake}}/zones/{{dataplex_zone}}/assets/{{name}}."
  value       = google_dataplex_asset.asset.id
}

output "name" {
  description = "The name of the asset."
  value       = google_dataplex_asset.asset.name
}

output "uid" {
  description = "System generated globally unique ID for the zone."
  value       = google_dataplex_asset.asset.uid
}

output "state" {
  description = "Current state of the asset. Possible values: STATE_UNSPECIFIED, ACTIVE, CREATING, DELETING, ACTION_REQUIRED."
  value       = google_dataplex_asset.asset.state
}

output "discovery_status" {
  description = "Status of the discovery feature applied to data referenced by this asset."
  value       = google_dataplex_asset.asset.discovery_status
}

output "resource_status" {
  description = "Status of the resource referenced by this asset."
  value       = google_dataplex_asset.asset.resource_status
}

output "security_status" {
  description = "Status of the security policy applied to resource referenced by this asset."
  value       = google_dataplex_asset.asset.security_status
}