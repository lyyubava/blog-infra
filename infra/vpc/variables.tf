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



variable "region" {
  type = string
}
