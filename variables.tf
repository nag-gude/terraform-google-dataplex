variable "project_id" {
  description = "The project where the resources will be created"
  type        = string
}

variable "location" {
  description = "The location for the resource"
  type        = string
}

variable "lake" {
  description = "The Dataplex Lake resources attributes"
  type = object({
    name         = string                       # Required - The name of the lake.
    description  = optional(string)             # Optional - Description of the lake. Default value is `null`.
    display_name = optional(string)             # Optional - User friendly display name. Default value is `null`.
    labels       = optional(map(string), {})    # Optional - User-defined labels for the lake. Default value is `{}`.
    metastore    = optional(string, null)       # Optional - Settings to manage lake and Dataproc Metastore service instance association. Default value is `null`.
  })
}

variable "zone" {
  description = "The Dataplex zone resource attributes."
  type = object({
    name             = string                     # Required - The name of the zone.
    type             = string                     # Required - The type of the zone. Possible values: `TYPE_UNSPECIFIED`, `RAW`, `CURATED`.
    description      = optional(string)           # Optional - Description of the zone. Default value is `null`.
    display_name     = optional(string)           # Optional - User friendly display name. Default value is `null`.
    labels           = optional(map(string))      # Optional - User defined labels for the zone. Default value is `{}`.
    location_type    = optional(string)           # Optional - The location type of the resources that are allowed to be attached to the assets within this zone. Possible values: LOCATION_TYPE_UNSPECIFIED, SINGLE_REGION, MULTI_REGION
    enabled          = bool                       # Required - Whether discovery is enabled
    include_patterns = optional(list(string))     # Optional - The list of patterns to apply for selecting data to include during discovery if only a subset of the data should considered
    exclude_patterns = optional(list(string))     # Optional - The list of patterns to apply for selecting data to exclude during discovery
    schedule         = optional(string)           # Optional - Cron schedule for running discovery periodically
    csv_options = optional(object({
      delimiter              = optional(string),  # Optional - The delimiter being used to separate values. This defaults to ","
      header_rows            = optional(number),  # Optional - The number of rows to interpret as header rows that should be skipped when reading data rows.
      disable_type_inference = optional(bool),    # Optional - Whether to disable the inference of data type for CSV data. If true, all columns will be registered as strings.
      encoding               = optional(string)   # Optional - The character encoding of the data. The default is UTF-8.
    }))
    json_options = optional(object({
      disable_type_inference = optional(bool),    # Optional - Whether to disable the inference of data type for Json data. If true, all columns will be registered as their primitive types (strings, number or boolean).
      encoding               = optional(string)   # Optional - The character encoding of the data. The default is UTF-8.
    }))
  })
}

variable "asset" {
  description = "The Dataplex asste resource attributes."
  type = object({
    name             = string                     # Required - The name of the asset.
    description      = optional(string)           # Optional - Description of the asset. Default value is `null`.
    display_name     = optional(string)           # Optional - User friendly display name. Default value is `null`.
    labels           = optional(map(string))      # Optional - User defined labels for the asset. Default value is `{}`.
    enabled          = bool                       # Required - Whether discovery is enabled
    include_patterns = optional(list(string))     # Optional - The list of patterns to apply for selecting data to include during discovery if only a subset of the data should considered
    exclude_patterns = optional(list(string))     # Optional - The list of patterns to apply for selecting data to exclude during discovery
    schedule         = optional(string)           # Optional - Cron schedule for running discovery periodically
    csv_options = optional(object({
      delimiter              = optional(string),  # Optional - The delimiter being used to separate values. This defaults to ","
      header_rows            = optional(number),  # Optional - The number of rows to interpret as header rows that should be skipped when reading data rows.
      disable_type_inference = optional(bool),    # Optional - Whether to disable the inference of data type for CSV data. If true, all columns will be registered as strings.
      encoding               = optional(string)   # Optional - The character encoding of the data. The default is UTF-8.
    }))
    json_options = optional(object({
      disable_type_inference = optional(bool),    # Optional - Whether to disable the inference of data type for Json data. If true, all columns will be registered as their primitive types (strings, number or boolean).
      encoding               = optional(string)   # Optional - The character encoding of the data. The default is UTF-8.
    })),
    resource_spec_name = string                   # Required - Relative name of the cloud resource that contains the data that is being managed within a lake.
    resource_spec_type = string                   # Required - Type of resource. Possible values: STORAGE_BUCKET, BIGQUERY_DATASET.
  })
}