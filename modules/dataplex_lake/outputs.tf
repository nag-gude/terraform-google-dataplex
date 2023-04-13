output "id" {
  description = "An identifier for the resource with format projects/{{project}}/locations/{{location}}/lakes/{{name}}."
  value       = google_dataplex_lake.lake.id
}

output "uid" {
  description = "System generated globally unique ID for the lake."
  value       = google_dataplex_lake.lake.uid
}

output "state" {
  description = "Current state of the lake. Possible values: `STATE_UNSPECIFIED`, `ACTIVE`, `CREATING`, `DELETING`, `ACTION_REQUIRED`."
  value       = google_dataplex_lake.lake.state
}

output "service_account" {
  description = "Service account associated with this lake."
  value       = google_dataplex_lake.lake.service_account
}

output "name" {
  description = "The name of the lake resource."
  value       = google_dataplex_lake.lake.name
}