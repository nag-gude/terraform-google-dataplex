terraform {
  backend "gcs" {
    bucket = "core-outrider-terraform-state"
    prefix = "dataplex/"
  }
}