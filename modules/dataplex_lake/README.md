# google_dataplex_lake

This module creates the Dataplex Lake resource.

## Compatibility 

This module is meant for use with Terraform 1.3.0.

## Usage

Basic usage of this module is as follows:

```hcl
module "basic_lake" {
  source  = "./modules/dataplex_lake"

  name         = "lake"
  location     = "europe-west2"
  description  = "Lake for DCL"
  display_name = "Lake for DCL"
  project_id   = "my-project-name"
  labels       = { my-lake = "exists" }
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | The name of the lake | `string` | n/a | yes |
| location | The location for the lake | `string` | n/a | yes |
| description | Description of the lake | `string` | `null` | no |
| display\_name | User friendly display name | `string` | `null` | no |
| labels | User-defined labels for the lake | `map(string)` | `{}` | no |
| project\_id | The project for the resource | `string` | n/a | yes |
| metastore | Settings to manage lake and Dataproc Metastore service instance association | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | An identifier for the resource with format projects/{{project}}/locations/{{location}}/lakes/{{name}}. |
| uid | System generated globally unique ID for the lake. |
| state | Current state of the lake. Possible values: `STATE_UNSPECIFIED`, `ACTIVE`, `CREATING`, `DELETING`, `ACTION_REQUIRED`. |
| service\_account | Service account associated with this lake. |
| name | The name of the lake resource. |

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