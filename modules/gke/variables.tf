variable "name" {
    type = string
}

variable "location" {
    type = string
}

 variable "subnetwork" {
     type = string
 }
 
 variable "network" {
     type = string
 }

variable "master_ipv4_cidr_block" {
    type = string
}

variable "cluster_ipv4_cidr_block" {
    type = string
}

variable "services_ipv4_cidr_block" {
  type = string
}

variable "master_authorized_networks" {

    type = object(
        {
            name = string
            cidr_block = string
        }
    )
  
}
variable "region" {
    type = string
}
variable "project_id" { 
    type = string
}