output "id" {
  description = "An identifier for the resource with format projects/{{project}}/locations/{{location}}/lakes/{{lake}}/zones/{{name}}."
  value       = google_dataplex_zone.zone.id
}

output "name" {
  description = "The name of the zone."
  value       = google_dataplex_zone.zone.name
}

output "uid" {
  description = "System generated globally unique ID for the zone."
  value       = google_dataplex_zone.zone.uid
}

output "state" {
  description = "Current state of the zone. Possible values: STATE_UNSPECIFIED, ACTIVE, CREATING, DELETING, ACTION_REQUIRED."
  value       = google_dataplex_zone.zone.state
}

output "asset_status" {
  description = "Aggregated status of the underlying assets of the zone."
  value       = google_dataplex_zone.zone.asset_status
}