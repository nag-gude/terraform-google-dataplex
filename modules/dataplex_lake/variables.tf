variable "name" {
  description = "The name of the lake"
  type        = string
}

variable "location" {
  description = "The location for the resource"
  type        = string
}

variable "description" {
  description = "Description of the lake"
  type        = string
  default     = null
}

variable "display_name" {
  description = "User friendly display name"
  type        = string
  default     = null
}

variable "labels" {
  description = "User-defined labels for the lake"
  type        = map(string)
  default     = {}
}

variable "project_id" {
  description = "The project for the resource"
  type        = string
}

variable "metastore" {
  description = "Settings to manage lake and Dataproc Metastore service instance association"
  type        = string
  default     = null
}