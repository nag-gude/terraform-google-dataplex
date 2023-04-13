project_id = "core-outrider-382810"
location   = "europe-west2"

lakes = {
  name        = "test-lake"
  description = "This is test lake"
  labels      = { env = "test" }
}

zones = {
  name          = "test-zone"
  type          = "RAW"
  description   = "This is test zone"
  display_name  = "This is test zone"
  enabled       = false
  location_type = "SINGLE_REGION"
}

assets = {
  name               = "test-asset"
  description        = "This is test asset"
  display_name       = "test-asset"
  enabled            = false
  resource_spec_name = "projects/core-outrider-382810/buckets/core-outrider-dataplex-test-bucket"
  resource_spec_type = "STORAGE_BUCKET"
}