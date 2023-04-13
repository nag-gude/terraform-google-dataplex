variable "dataplex_zone" {
  description = "The zone for the resource"
  type        = string
}

variable "dataplex_lake" {
  description = "The lake for the resource"
  type        = string
}

variable "location" {
  description = "The location for the resource"
  type        = string
}

variable "name" {
  description = "The name of the asset"
  type        = string
}

variable "project_id" {
  description = "The project for the resource"
  type        = string
}

variable "description" {
  description = "Description of the asset"
  type        = string
  default     = null
}

variable "display_name" {
  description = "User friendly display name"
  type        = string
  default     = null
}

variable "labels" {
  description = "User defined labels for the asset"
  type        = map(string)
  default     = {}
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
  description = "Configuration for Json data"
  type        = map(any)
  # Object with keys:
  # - disable_type_inference - (Optional) Whether to disable the inference of data type for Json data. If true, all columns will be registered as their primitive types (strings, number or boolean).
  # - encoding - (Optional) The character encoding of the data. The default is UTF-8.
  default = null
}

variable "resource_spec_name" {
  description = "Relative name of the cloud resource that contains the data that is being managed within a lake"
  type        = string
}

variable "resource_spec_type" {
  description = "Type of resource. Possible values: STORAGE_BUCKET, BIGQUERY_DATASET"
  type        = string

  validation {
    condition     = contains(["STORAGE_BUCKET", "BIGQUERY_DATASET"], var.resource_spec_type)
    error_message = "Supported types are 'STORAGE_BUCKET', 'BIGQUERY_DATASET'."
  }
}