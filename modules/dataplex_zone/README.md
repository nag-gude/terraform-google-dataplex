# google_dataplex_zone

This module creates the Dataplex Zone resource.

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
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| dataplex\_lake | The lake for the resource | `string` | n/a | yes |
| location | The location for the zone | `string` | n/a | yes |
| name | The name of the zone | `string` | n/a | yes |
| type | The type of the zone. Possible values: `TYPE_UNSPECIFIED`, `RAW`, `CURATED` | `string` | n/a | yes |
| description | Description of the zone | `string` | `null` | no |
| display\_name | User friendly display name | `string` | `null` | no |
| project\_id | The project for the resource | `string` | n/a | yes |
| labels | User defined labels for the zone | `map(string)` | `{}` | no |
| location\_type | The location type of the resources that are allowed to be attached to the assets within this zone. Possible values: `LOCATION_TYPE_UNSPECIFIED`, `SINGLE_REGION`, `MULTI_REGION` | `string` | `SINGLE_REGION` | no |
| enabled | Whether discovery is enabled | `bool` | n/a | yes |
| include\_patterns | The list of patterns to apply for selecting data to include during discovery if only a subset of the data should considered | `list(string)` | `[]` | no |
| exclude\_patterns | The list of patterns to apply for selecting data to exclude during discovery | `list(string)` | `[]` | no |
| schedule | Cron schedule for running discovery periodically | `string` | `null` | no |
| csv\_options | Configuration for CSV data | <pre>object({<br>    # Object with keys:<br>    # - delimiter - (Optional) The delimiter being used to separate values. This defaults to ",".<br>    # - header_rows - (Optional) The number of rows to interpret as header rows that should be skipped when reading data rows.<br>    # - disable_type_inference - (Optional) Whether to disable the inference of data type for CSV data. If true, all columns will be registered as strings.<br>    # - encoding - (Optional) The character encoding of the data. The default is UTF-8.<br> })</pre> | `null` | no |
| json\_options | Configuration for Json data | <pre>object({<br>    # Object with keys:<br>    # - disable_type_inference - (Optional) Whether to disable the inference of data type for CSV data. If true, all columns will be registered as strings.<br>    # - encoding - (Optional) The character encoding of the data. The default is UTF-8.<br> })</pre>  | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | An identifier for the resource with format projects/{{project}}/locations/{{location}}/lakes/{{lake}}/zones/{{name}}. |
| name | The name of the zone. |
| uid | System generated globally unique ID for the zone. |
| state | Current state of the zone. Possible values: `STATE_UNSPECIFIED`, `ACTIVE`, `CREATING`, `DELETING`, `ACTION_REQUIRED`. |
| asset\_status | Aggregated status of the underlying assets of the zone. |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

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