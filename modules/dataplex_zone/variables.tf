variable "dataplex_lake" {
  description = "The lake for the resource"
  type        = string
}

variable "location" {
  description = "The location for the zone"
  type        = string
}

variable "name" {
  description = "The name of the zone"
  type        = string
}

variable "type" {
  description = "The type of the zone. Possible values: `TYPE_UNSPECIFIED`, `RAW`, `CURATED`"
  type        = string

  validation {
    condition     = contains(["TYPE_UNSPECIFIED", "RAW", "CURATED"], var.type)
    error_message = "Supported types are 'RAW', 'CURATED', 'TYPE_UNSPECIFIED'."
  }
}

variable "description" {
  description = "Description of the zone"
  type        = string
  default     = null
}

variable "display_name" {
  description = "User friendly display name"
  type        = string
  default     = null
}

variable "project_id" {
  description = "The project for the resource"
  type        = string
}

variable "labels" {
  description = "User defined labels for the zone"
  type        = map(string)
  default     = {}
}

variable "location_type" {
  description = "The location type of the resources that are allowed to be attached to the assets within this zone. Possible values: LOCATION_TYPE_UNSPECIFIED, SINGLE_REGION, MULTI_REGION"
  type        = string
  default     = "SINGLE_REGION"

  validation {
    condition     = contains(["SINGLE_REGION", "MULTI_REGION", "LOCATION_TYPE_UNSPECIFIED"], var.location_type)
    error_message = "Supported location types are 'SINGLE_REGION', 'MULTI_REGION', 'LOCATION_TYPE_UNSPECIFIED'."
  }
}

variable "enabled" {
  description = "Whether discovery is enabled"
  type        = bool
}

variable "include_patterns" {
  description = "The list of patterns to apply for selecting data to include during discovery if only a subset of the data should considered"
  type        = list(string)
  default     = []
}

variable "exclude_patterns" {
  description = "The list of patterns to apply for selecting data to exclude during discovery"
  type        = list(string)
  default     = []
}

variable "schedule" {
  description = "Cron schedule for running discovery periodically"
  type        = string
  default     = null
}

variable "csv_options" {
  description = "Configuration for CSV data"
  type        = map(any)
  # Object with keys:
  # - delimiter - (Optional) The delimiter being used to separate values. This defaults to ",".
  # - header_rows - (Optional) The number of rows to interpret as header rows that should be skipped when reading data rows.
  # - disable_type_inference - (Optional) Whether to disable the inference of data type for CSV data. If true, all columns will be registered as strings.
  # - encoding - (Optional) The character encoding of the data. The default is UTF-8.
  default = null
}

variable "json_options" {
  description = "Configuration for JSON data"
  type        = map(any)
  # Object with keys:
  # - disable_type_inference - (Optional) Whether to disable the inference of data type for Json data. If true, all columns will be registered as their primitive types (strings, number or boolean).
  # - encoding - (Optional) The character encoding of the data. The default is UTF-8.
  default = null
}