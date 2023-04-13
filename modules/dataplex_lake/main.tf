resource "google_dataplex_lake" "lake" {
  name         = var.name
  project      = var.project_id
  location     = var.location
  description  = var.description
  display_name = var.display_name
  labels       = var.labels

  dynamic "metastore" {
    for_each = var.metastore != null ? { "meta" : var.metastore } : {}
    content {
      service = metastore.value
    }
  }
}