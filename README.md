# terraform-google-dataplex

This module allows to provision the following Dataplex resources:

- Setting up a lake
- Establishing a zone within the created lake
- Creating an asset in the zone which belongs to the lake.

## Compatibility 

This module is meant for use with Terraform 1.3.0.

## Usage

Basic usage of this module is as follows:

```hcl
module "basic_lake" {
  source  = "./modules/dataplex_lake"

  name         = "lake"
  location     = "europe-west2"
  project_id   = "my-project-name"
}

module "basic_zone" {
  source  = "./modules/dataplex_zone"

  dataplex_lake = module.basic_lake.name
  name          = "zone"
  location      = "europe-west2"
  location_type = "SINGLE_REGION"
  enabled       = false
  type          = "RAW"
  project_id    = "my-project-name"
}

module "basic_asset" {
  source  = "./modules/dataplex_asset"

  dataplex_lake       = module.basic_lake.name
  dataplex_zone       = module.basic_zone.name
  name                = "asset"
  location            = "europe-west2"
  enabled             = false
  resource_spec_type  = "STORAGE_BUCKET"
  resource_spec_type  = "projects/my-project-name/buckets/dataplex-bucket"
  project_id          = "my-project-name"
}
```

## Example

See [`terraform.tfvars`](./terraform.tfvars) for the example.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|-------------------|---------|:--------:|
| project\_id | The project where the resources will be created. | `string` | n/a | yes |
| location | The location for the resource. | `string` | n/a | yes |
| lake | The Dataplex Lake resources attributes. | <pre>list(object({<br>    name                 = string,<br>    display_name       = optional(string),<br>    description        = optional(string),<br>    labels             = optional(map(string), {}),<br>    metastore = optional(string)<br>  }))</pre> | `[]` | no |
| zone | The Dataplex zone resource attributes. | <pre>list(object({<br>    name             = string,<br>    type             = string,<br>    display_name     = optional(string),<br>    description      = optional(string),<br>    labels           = optional(map(string), {}),<br>    enabled          = bool,<br>    schedule         = optional(string),<br>    include_patterns = optional(list(string), []),<br>    exclude_patterns = optional(list(string), []),<br>    csv_options = optional(object({<br>    delimiter              = optional(string, ","),<br>    header_rows            = optional(number, 0),<br>    disable_type_inference = optional(bool, false),<br>    encoding               = optional(string, "UTF-8")<br>})),<br>    json_options = optional(object({<br>    disable_type_inference = optional(bool, false),<br>    encoding               = optional(string, "UTF-8")<br>})),<br>    location_type = string<br> }))</pre> | `[]` | no |
| asset | The Dataplex asste resource attributes. | <pre>list(object({<br>    name           = string,<br>    display_name = optional(string),<br>    description  = optional(string),<br>    labels       = optional(map(string), {}),<br>    enabled          = bool,<br>    schedule         = optional(string),<br>    include_patterns = optional(list(string), []),<br>    exclude_patterns = optional(list(string), []),<br>    csv_options = optional(object({<br>        delimiter              = optional(string, ","),<br>        header_rows            = optional(number, 0),<br>        disable_type_inference = optional(bool, false),<br>        encoding               = optional(string, "UTF-8")<br>  })),<br>    json_options = optional(object({<br>        disable_type_inference = optional(bool, false),<br>        encoding               = optional(string, "UTF-8")<br>      })),<br>    resource_spec_name = string,<br>    resource_spec_type = string<br> }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| lake_id | An identifier for the resource with format projects/{{project}}/locations/{{location}}/lakes/{{name}}. |
| lake_name | The name of the lake resource. |
| lake_service_account | Service account associated with this lake. |
| zone_id | An identifier for the resource with format projects/{{project}}/locations/{{location}}/lakes/{{lake}}/zones/{{name}}. |
| zone_name | The name of the zone. |
| asset_id | An identifier for the resource with format projects/{{project}}/locations/{{location}}/lakes/{{lake}}/zones/{{dataplex_zone}}/assets/{{name}}. |
| asset_name | The name of the asset. |

## Requirements

These sections describe requirements for using this module.

### Software

The following dependencies must be available:

- [Terraform](https://www.terraform.io/downloads.html) >= 1.3.0
- [Terraform Provider for GCP][terraform-provider-gcp] plugin v3

### Service Account

A service account with the following roles must be used to provision
the resources of this module:

- Dataplex Admin: `roles/dataplex.admin`

### APIs

A project with the following APIs enabled must be used to host the
resources of this module:

- Dataplex API: `dataplex.googleapis.com`

## Notes

The assets that you discover must be located in the same region or regions as the location policy of the lake or zone that you create.