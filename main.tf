module "basic_lake" {
  source = "./modules/dataplex_lake"

  name         = var.lake.name
  project_id   = var.project_id
  location     = var.location
  description  = lookup(var.lake, "description", null)
  display_name = lookup(var.lake, "display_name", null)
  labels       = lookup(var.lake, "labels", {})
  metastore    = lookup(var.lake, "metastore", null)
}

module "basic_zone" {
  source = "./modules/dataplex_zone"

  dataplex_lake    = module.basic_lake.name
  name             = var.zone.name
  location         = var.location
  project_id       = var.project_id
  type             = var.zone.type
  description      = lookup(var.zone, "description", null)
  display_name     = lookup(var.zone, "display_name", null)
  labels           = lookup(var.zone, "labels", {})
  enabled          = var.zone.enabled
  include_patterns = lookup(var.zone, "include_patterns", [])
  exclude_patterns = lookup(var.zone, "exclude_patterns", [])
  schedule         = lookup(var.zone, "schedule", null)
  csv_options      = lookup(var.zone, "csv_options", null)
  json_options     = lookup(var.zone, "json_options", null)
  location_type    = lookup(var.zone, "location_type", "SINGLE_REGION")
}

module "primary" {
  source = "./modules/dataplex_asset"

  dataplex_lake      = module.basic_lake.name
  dataplex_zone      = module.basic_zone.name
  location           = var.location
  name               = var.asset.name
  project_id         = var.project_id
  description        = lookup(var.asset, "description", null)
  display_name       = lookup(var.asset, "display_name", null)
  labels             = lookup(var.asset, "labels", {})
  enabled            = var.asset.enabled
  include_patterns   = lookup(var.asset, "include_patterns", [])
  exclude_patterns   = lookup(var.asset, "exclude_patterns", [])
  schedule           = lookup(var.asset, "schedule", null)
  csv_options        = lookup(var.asset, "csv_options", null)
  json_options       = lookup(var.asset, "json_options", null)
  resource_spec_name = var.asset.resource_spec_name
  resource_spec_type = var.asset.resource_spec_type
}