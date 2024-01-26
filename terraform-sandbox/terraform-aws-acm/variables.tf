variable "route53_zone_name" {
  type = string
}

variable "subject_alternative_names" {
  type = list(string)
}

variable "ttl" {
  type    = number
  default = 60
}

variable "tags" {
  type = map(any)
}
