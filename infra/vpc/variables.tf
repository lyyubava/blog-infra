variable "name" {
  type = string
}

variable "subnets" {
  type = list(object({
    ip_cidr_range = string,
    name          = string
  }))

  default = []
}

variable "firewall_rules" {
  type = list(object(
    {
      name          = string,
      source_ranges = optional(list(string)),
      ports         = list(string),
      protocol      = string
      source_tags   = optional(string)
      target_tags   = optional(string)      

    }
  ))

  default = []
}

variable "region" {
  type = string
}
