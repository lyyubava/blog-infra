output "vpc_name" {
  value = google_compute_network.vpc_network.name
}

output "subnets" {
   value = { for k, v in google_compute_subnetwork.subnet : k => google_compute_subnetwork.subnet[k].name }
}

output "vpc_id" {
  value = google_compute_network.vpc_network.id
}
