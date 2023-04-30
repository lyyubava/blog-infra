variable "firewall_rules" {
  type = list(object(
    {
      name          = string,
      source_ranges = optional(list(string)),
      ports         = list(string),
      protocol      = string
      #direction     = string
      source_tags   = optional(string)
      target_tags   = optional(string)

    }
  ))
}
