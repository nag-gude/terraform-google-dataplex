resource "google_dataplex_asset" "asset" {
  dataplex_zone = var.dataplex_zone
  lake          = var.dataplex_lake
  location      = var.location
  name          = var.name
  project       = var.project_id
  description   = var.description
  display_name  = var.display_name
  labels        = var.labels

  discovery_spec {
    enabled          = var.enabled
    include_patterns = var.include_patterns
    exclude_patterns = var.exclude_patterns
    schedule         = var.schedule

    dynamic "csv_options" {
      for_each = var.csv_options != null ? { "csv_opt" : var.csv_options } : {}
      content {
        delimiter              = lookup(csv_options.value, "delimiter", ",")
        header_rows            = lookup(csv_options.value, "header_rows", 0)
        disable_type_inference = lookup(csv_options.value, "disable_type_inference", false)
        encoding               = lookup(csv_options.value, "encoding", "UTF-8")
      }
    }

    dynamic "json_options" {
      for_each = var.json_options != null ? { "json_opt" : var.json_options } : {}
      content {
        disable_type_inference = lookup(json_options.value, "disable_type_inference", false)
        encoding               = lookup(json_options.value, "encoding", "UTF-8")
      }
    }
  }

  resource_spec {
    name = var.resource_spec_name
    type = var.resource_spec_type
  }
}