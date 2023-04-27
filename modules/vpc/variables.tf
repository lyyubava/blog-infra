variable "name" {
  type = string
}

variable "subnets" {
  type = list(object({
    ip_cidr_range = string,
    name          = string
  }))
}

variable "firewall_rules" {
  type = list(object(
    {
      name          = string,
      source_ranges = optional(list(string)),
      ports         = list(string),
      protocol      = string
      direction     = string
      source_tags   = optional(string)
      target_tags   = optional(string)

    }
  ))
}

variable "region" {
  type = string
}
