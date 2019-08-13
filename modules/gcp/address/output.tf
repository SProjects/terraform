output "address" {
  value = "${google_compute_global_address.this.address}"
}

output "self_link" {
  value = "${google_compute_global_address.this.self_link}"
}

