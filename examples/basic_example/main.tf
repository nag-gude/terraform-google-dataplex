module "dataplex" {
  source = "../.."

  project_id = var.project_id
  location   = var.location
  lake       = var.lakes
  zone       = var.zones
  asset      = var.assets
}