variable "name" {
  type = string
}

variable "subnets" {
  type = list(object({
    ip_cidr_range = string,
    name          = string
  }))
}

variable "region" {
  type = string
}


variable "address_for_service_networking_connection" {
  type = string
}

variable "project_id" {
  type = string
}