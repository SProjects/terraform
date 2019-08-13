
output "network" {
  value = "${google_compute_network.this.self_link}"
  description = "VPC network"
}

output "public_subnetwork" {
  value = "${google_compute_subnetwork.public_subnetwork.self_link}"
  description = "Public subnetwork"
}

output "private_subnetwork" {
  value = "${google_compute_subnetwork.private_subnetwork.self_link}"
  description = "Private subnetwork"
}
