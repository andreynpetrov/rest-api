variable "environment" {
  type = string

  validation {
    condition     = contains(["dev", "stg", "prd"], var.environment) == true
    error_message = "Unknown environment"
  }
}

variable "cluster" {
  type = string

  validation {
    condition     = contains(["blue", "green", "common"], var.cluster) == true
    error_message = "Unknown cluster"
  }
}

variable "separator" {
  type    = string
  default = "-"
}

variable "length" {
  type    = number
  default = 1
}

variable "enabled" {
  type    = bool
  default = false
}

variable "enabled_s3_data" {
  type    = bool
  default = false
}

