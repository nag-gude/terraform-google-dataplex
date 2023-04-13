variable "project_id" {
  description = "The project where the resources will be created."
  type        = string
}

variable "location" {
  description = "The location for the resource."
  type        = string
}

variable "lakes" {
  description = "A Dataplex lake that need to be created"
  type = object({
    name         = string,
    display_name = optional(string),
    description  = optional(string),
    labels       = optional(map(string)),
    metastore    = optional(string)
  })
  default = null
}

variable "zones" {
  description = "A Dataplex zone that need to be created"
  type = object({
    name             = string,
    type             = string,
    display_name     = optional(string),
    description      = optional(string),
    labels           = optional(map(string)),
    enabled          = bool,
    schedule         = optional(string),
    include_patterns = optional(list(string)),
    exclude_patterns = optional(list(string)),
    csv_options = optional(object({
      delimiter              = optional(string),
      header_rows            = optional(number)
      disable_type_inference = optional(bool),
      encoding               = optional(string)
    }))
    json_options = optional(object({
      disable_type_inference = optional(bool),
      encoding               = optional(string)
    })),
    location_type = string
  })
  default = null
}

variable "assets" {
  description = "A Dataplex asset that need to be created"
  type = object({
    name             = string,
    display_name     = optional(string),
    description      = optional(string),
    labels           = optional(map(string)),
    enabled          = bool,
    schedule         = optional(string),
    include_patterns = optional(list(string)),
    exclude_patterns = optional(list(string)),
    csv_options = optional(object({
      delimiter              = optional(string),
      header_rows            = optional(number)
      disable_type_inference = optional(bool),
      encoding               = optional(string)
    }))
    json_options = optional(object({
      disable_type_inference = optional(bool),
      encoding               = optional(string)
    })),
    resource_spec_name = string,
    resource_spec_type = string
  })
  default = null
}